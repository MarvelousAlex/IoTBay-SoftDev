package com.dao;

import java.sql.*;


public class DBManager {

    private Connection connection;

    private CustomerDao customerDao;
    private UserAccessLogDao userAccessLogDao;
    private StaffDao staffDao;

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

}
