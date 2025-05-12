package Model.dao;

import Model.User;
import java.sql.*;

public abstract class DBManager<T> {
    protected final Statement statement;
    protected final Connection connection;

    public DBManager(Connection connection) throws SQLException {
        this.connection = connection;
        statement = connection.createStatement();
    }

    public User get(int id) throws SQLException {
        String sql = "SELECT id, email, password, name FROM Users WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) {
                    return null;  // or throw new NotFoundException(...)
                }
                return new User(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("name")
                );
            }
        }
    }

    public abstract T add(T object) throws SQLException;
    public abstract T get(T object) throws SQLException;
    public abstract void update(T oldObject, T newObject) throws SQLException;
    public abstract void delete(T object) throws SQLException;

}
