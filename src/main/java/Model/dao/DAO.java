package Model.dao;

import java.sql.Connection;
import java.sql.SQLException;

public class DAO {
    private final Connection connection;
    private final UserDBManager userDBManager;

    public DAO() throws SQLException {
        this.connection = new DBConnector().getConnection();
        this.userDBManager = new UserDBManager(connection);
    }

    public Connection getConnection() {
        return connection;
    }

    public UserDBManager Users() {
        return userDBManager;
    }

    public void close() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}