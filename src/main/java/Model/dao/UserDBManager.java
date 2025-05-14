package Model.dao;

import Model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDBManager extends DBManager<User> {
    public int getUserCount() throws SQLException {
        ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) FROM User");
        resultSet.next();
        return resultSet.getInt(1);
    }

    public User findByEmail(String email) throws SQLException {
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM User WHERE email = ?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            User user = new User(
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("name")
            );
            user.setId(rs.getInt("id"));
            return user;
        }
        return null;
    }

    public UserDBManager(Connection connection) throws SQLException {
        super(connection);
    }

    //CREATE
    public User add(User user) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO User(Email, Password, Name) VALUES (?, ?, ?)");
        preparedStatement.setString(1, user.getEmail());
        preparedStatement.setString(2, user.getPassword());
        preparedStatement.setString(3, user.getName());
        preparedStatement.executeUpdate();

        preparedStatement = connection.prepareStatement("SELECT MAX(id) FROM User");
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        int userId = resultSet.getInt(1);
        user.setId(userId);
        return user;
    }

    public User get(User user) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM User WHERE id = ?");
        preparedStatement.setInt(1, user.getId());
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        return new User(resultSet.getInt(1),
                resultSet.getString(2),
                resultSet.getString(3),
                resultSet.getString(4),
                resultSet.getString(5));
    }

    public User getUserByEmailAndPassword(String email, String password) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM User WHERE email = ? AND password = ?");
        preparedStatement.setString(1, email);
        preparedStatement.setString(2, password);
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        User user =  new User();
        user.setId(resultSet.getInt(1));
        user.setEmail(resultSet.getString(2));
        user.setPassword(resultSet.getString(3));
        user.setName(resultSet.getString(4));
        return user;
    }

    //UPDATE
    public void update(User oldUser, User newUser) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("UPDATE User SET email = ?, password = ?, name = ? WHERE id = ?");
        preparedStatement.setString(1, newUser.getEmail());
        preparedStatement.setString(2, newUser.getPassword());
        preparedStatement.setString(3, newUser.getName());
        preparedStatement.setInt(4, oldUser.getId());
        preparedStatement.executeUpdate();
    }

    //DELETE
    public void delete(User user) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM User WHERE id = ?");
        preparedStatement.setInt(1, user.getId());
        preparedStatement.executeUpdate();
    }
}
