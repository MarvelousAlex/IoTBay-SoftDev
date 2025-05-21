package Model.dao;

import Model.Order;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDBManager extends DBManager<Order> {

    /** Matches UserDBManager’s constructor signature */
    public OrderDBManager(Connection connection) throws SQLException {
        super(connection);
    }

    /** CREATE */
    @Override
    public Order add(Order o) throws SQLException {
        String sql =
                "INSERT INTO Orders(customerId, product, quantity, orderDate, status) " +
                        "VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(
                sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, o.getCustomerId());
            ps.setString(2, o.getProduct());
            ps.setInt(3, o.getQuantity());
            ps.setString(4, o.getOrderDate());
            ps.setString(5, o.getStatus());
            ps.executeUpdate();

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    o.setId(keys.getInt(1));
                }
            }
        }
        return o;
    }

    /** READ by key */
    @Override
    public Order get(Order key) throws SQLException {
        String sql = "SELECT * FROM Orders WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, key.getId());
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }
        }
        return null;
    }

    /** READ all */
    public List<Order> getAll() throws SQLException {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM Orders";
        try (ResultSet rs = statement.executeQuery(sql)) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        }
        return list;
    }

    /** UPDATE */
    @Override
    public void update(Order oldO, Order newO) throws SQLException {
        String sql =
                "UPDATE Orders " +
                        "SET product = ?, quantity = ?, orderDate = ?, status = ? " +
                        "WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, newO.getProduct());
            ps.setInt(2, newO.getQuantity());
            ps.setString(3, newO.getOrderDate());
            ps.setString(4, newO.getStatus());
            ps.setInt(5, oldO.getId());
            ps.executeUpdate();
        }
    }

    /** DELETE */
    @Override
    public void delete(Order o) throws SQLException {
        String sql = "DELETE FROM Orders WHERE id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, o.getId());
            ps.executeUpdate();
        }
    }

    /** Helper to map a row into an Order object */
    private Order mapRow(ResultSet rs) throws SQLException {
        return new Order(
                rs.getInt("id"),
                rs.getInt("customerId"),
                rs.getString("product"),
                rs.getInt("quantity"),
                rs.getString("orderDate"),
                rs.getString("status")
        );
    }

    public java.util.List<Order> filter(Integer id, String fromDate, String toDate) throws SQLException {
        java.util.List<Order> results = new java.util.ArrayList<>();
        StringBuilder sb = new StringBuilder("SELECT * FROM Orders WHERE 1=1");
        if (id != null)          sb.append(" AND id = ?");
        if (fromDate != null && !fromDate.isEmpty()) sb.append(" AND orderDate >= ?");
        if (toDate   != null && !toDate.isEmpty())   sb.append(" AND orderDate <= ?");
        try (PreparedStatement ps = connection.prepareStatement(sb.toString())) {
            int idx = 1;
            if (id != null)          ps.setInt(idx++, id);
            if (fromDate != null && !fromDate.isEmpty()) ps.setString(idx++, fromDate);
            if (toDate   != null && !toDate.isEmpty())   ps.setString(idx++, toDate);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    results.add(mapRow(rs));
                }
            }
        }
        return results;
    }
}
