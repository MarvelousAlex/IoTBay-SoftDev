package Controller;

import Model.Payment;
import Model.dao.PayDAO;
import Model.dao.PaymentDBConnector;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/PaymentHistoryServlet")
public class PaymentHistoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer userId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            PaymentDBConnector connector = new PaymentDBConnector();
            Connection conn = connector.getConnection();
            PayDAO dao = new PayDAO(conn);
            List<Payment> payments = dao.fetchPaymentsByUser(userId);
            request.setAttribute("payments", payments);
            RequestDispatcher dispatcher = request.getRequestDispatcher("paymentHistory.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}