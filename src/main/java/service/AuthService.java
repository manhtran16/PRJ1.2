package service;

import model.User;
import repository.UserDAO;
import utils.Validate;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AuthService {
    private UserDAO userDao;

    public AuthService(UserDAO userDao) {
        this.userDao = userDao;
    }

    public int login(HttpServletRequest request, HttpServletResponse response, String email, String password) {
        try {
            int status = userDao.checkLoginUser(email, password);
            String rememberLogin = request.getParameter("remember");
            switch (status) {
                case 0:
                    User user = userDao.getUserByEmail(email);
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    if (user.getUserRole() == 0) {
                        if (Validate.checkString(rememberLogin)) {
                            Cookie cookie = new Cookie("rememberUser", String.valueOf(user.getUserID()));
                            cookie.setMaxAge(60 * 60 * 24 * 30); 
                            response.addCookie(cookie);
                        }
                        return 0; // user login
                    } else {
                        return 3; // admin login
                    }
                case 1:
                    return 1; // wrong password
                case 2:
                    return 2; // user not found
                default:
                    return -1;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -2; // server error
        }
    }

    public int register(HttpServletRequest request, User user, String password) {
        try {
            if (userDao.getUserByUserName(user.getUserName()) != null) {
                return 1; // user exists
            }
            if (userDao.getUserByEmail(user.getEmail()) != null) {
                return 2; // email exists
            }
            userDao.createUser(user, password);
            return 0; // success
        } catch (Exception e) {
            e.printStackTrace();
            return -1; // server error
        }
    }
}