package service.admin;

import repository.OrderDAO;
import repository.ProductDAO;
import repository.UserDAO;

public class DashboardService {

    public long getTotalOrders() {
        OrderDAO oDao = new OrderDAO();
        return oDao.getTotalOrders();
    }

    public long getTotalProducts() {
        ProductDAO pDao = new ProductDAO();
        return pDao.getTotalProducts();
    }

    public long getTotalCustomers() {
        UserDAO uDao = new UserDAO();
        return uDao.getTotalCustomers();
    }

    public double getTotalRevenue() {
        OrderDAO oDao = new OrderDAO();
        return oDao.getTotalRevenue();
    }
}
