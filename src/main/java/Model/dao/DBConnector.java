package Model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Driver;

public class DBConnector {
    private static final String JDBC_URL = "jdbc:sqlite:IoTBayDB.db";
    private Connection connection;

    // Load the JDBC driver once
    static {
        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("SQLite JDBC driver not found", e);
        }
    }

    // No-op constructor; connection is initialised lazily
    public DBConnector() { }

    /**
     * Returns a live JDBC connection, opening it if needed, and
     * initialises required tables.
     */
    public Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            connection = DriverManager.getConnection(JDBC_URL);
            connection.setAutoCommit(true);
            System.out.println("Connected to database");
            initTables();
        }
        return connection;
    }

    /**
     * Creates necessary tables if they do not already exist.
     */
    private void initTables() throws SQLException {
        try (Statement stmt = connection.createStatement()) {
            // RegisteredUser table
            stmt.executeUpdate(
                    "CREATE TABLE IF NOT EXISTS RegisteredUser ("
                            + "UserId INTEGER PRIMARY KEY AUTOINCREMENT,"
                            + "Email TEXT UNIQUE NOT NULL,"
                            + "PasswordHash TEXT NOT NULL,"
                            + "FullName TEXT NOT NULL,"
                            + "UserType TEXT NOT NULL,"
                            + "PhoneNumber TEXT,"
                            + "Active INTEGER NOT NULL DEFAULT 1"
                            + ");"
            );
            stmt.executeUpdate(
                "CREATE TABLE IF NOT EXISTS User ("
                + "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                + "email TEXT UNIQUE NOT NULL,"
                + "password TEXT NOT NULL,"
                + "name TEXT NOT NULL,"
                + "userType TEXT NOT NULL"
                + ");"
            );
        }
    }

    /**
     * Closes the JDBC connection if open.
     */
    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Connection closed");
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                connection = null;
            }
        }
    }
}
