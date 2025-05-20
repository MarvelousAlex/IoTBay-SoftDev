package com.dao;

import java.sql.*;


public class DBManager {

    private final Connection connection;

    private CustomerDao customerDao;
    private UserAccessLogDao userAccessLogDao;
    private StaffDao staffDao;
    private ProductDao productDao;
    private CategoryDao categoryDao;
    private OrderDao orderDao;

    public DBManager(Connection connection) throws SQLException {
        this.connection = connection;
    }

    public CustomerDao getCustomerDao() {
        if (customerDao == null) {
            customerDao = new CustomerDao(connection);
        }
        return customerDao;
    }

    public UserAccessLogDao getUserAccessLogDao() {
        if (userAccessLogDao == null) {
            userAccessLogDao = new UserAccessLogDao(connection);
        }
        return userAccessLogDao;
    }

    public StaffDao getStaffDao() {
        if (staffDao == null) {
            staffDao = new StaffDao(connection);
        }
        return staffDao;
    }

    public ProductDao getProductDao() {
        if (productDao == null) {
            productDao = new ProductDao(connection);
        }
        return productDao;
    }

    public CategoryDao getCategoryDao() {
        if (categoryDao == null) {
            categoryDao = new CategoryDao(connection);
        }
        return categoryDao;
    }

    public OrderDao getOrderDao() {
        if (orderDao == null) {
            orderDao = new OrderDao(connection);
        }
        return orderDao;
    }

}
