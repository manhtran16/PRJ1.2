package service.admin;

import repository.OrderDao;
import repository.ProductDao;
import repository.UserDao;

public class DashboardService {

    public long getTotalOrders() {
        OrderDao oDao = new OrderDao();
        return oDao.getTotalOrders();
    }

    public long getTotalProducts() {
        ProductDao pDao = new ProductDao();
        return pDao.getTotalProducts();
    }

    public long getTotalCustomers() {
        UserDao uDao = new UserDao();
        return uDao.getTotalCustomers();
    }

    public double getTotalRevenue() {
        OrderDao oDao = new OrderDao();
        return oDao.getTotalRevenue();
    }
}
