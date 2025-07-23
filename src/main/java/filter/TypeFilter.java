package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import repository.TypeDao;
import model.Type;
import java.io.IOException;
import java.util.List;

/**
 * Filter to automatically load types for all JSP pages
 * This eliminates the need to manually load types in every controller
 */
@WebFilter("/*")
public class TypeFilter implements Filter {

    private TypeDao typeDao;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.typeDao = new TypeDao();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;

        // Only load types for JSP pages (not for admin, APIs, or static resources)
        String requestURI = httpRequest.getRequestURI();
        boolean isJspRequest = requestURI.endsWith(".jsp") ||
                requestURI.contains("/index") ||
                requestURI.contains("/products") ||
                requestURI.contains("/cart") ||
                requestURI.contains("/displayPro") ||
                requestURI.contains("/variantDetail");

        if (isJspRequest && !requestURI.contains("/admin/")) {
            try {
                // Load types if not already loaded
                if (request.getAttribute("types") == null) {
                    List<Type> types = typeDao.getType();
                    request.setAttribute("types", types);
                }
            } catch (Exception e) {
                e.printStackTrace();
                // Continue even if types loading fails
            }
        }

        // chain có tác dụng chuyển tiếp rq đến filter, servlet,jsp tiếp
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup if needed
        this.typeDao = null;
    }
}
