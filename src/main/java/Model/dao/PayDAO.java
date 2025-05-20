package Model.dao;

import Model.Payment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Model.dao.PaymentDBConnector;

public class PayDAO {
    private final Connection conn;

    public PayDAO() throws SQLException {
        this.conn = new PaymentDBConnector().getConnection();
    }

    public PayDAO(Connection conn) {
        this.conn = conn;
    }

    public void insertPayment(Payment payment) throws SQLException {
        String sql = "INSERT INTO Payments (userId, method, cardNumber, amount, paymentDate, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, payment.getUserId());
            stmt.setString(2, payment.getMethod());
            stmt.setString(3, payment.getCardNumber());
            stmt.setDouble(4, payment.getAmount());
            stmt.setDate(5, java.sql.Date.valueOf(payment.getPaymentDate()));
            stmt.setString(6, payment.getStatus());
            stmt.executeUpdate();
        }
    }

    public List<Payment> fetchPaymentsByUser(int userId) throws SQLException {
        List<Payment> payments = new ArrayList<>();
        String sql = "SELECT * FROM Payments WHERE userId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Payment payment = new Payment(
                    rs.getInt("id"),
                    rs.getInt("userId"),
                    rs.getString("method"),
                    rs.getString("cardNumber"),
                    rs.getDouble("amount"),
                    rs.getString("paymentDate"),
                    rs.getString("status")
                );
                payments.add(payment);
            }
        }
        return payments;
    }
}
