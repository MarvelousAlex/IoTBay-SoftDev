
package Controller;

import Model.Payment;
import Model.dao.PayDAO;
import Model.dao.PaymentDBConnector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String method = request.getParameter("method");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String date = request.getParameter("date");
        boolean saveMethod = request.getParameter("saveMethod") != null;

        try {
            PaymentDBConnector connector = new PaymentDBConnector();
            Connection conn = connector.getConnection();
            PayDAO dao = new PayDAO(conn);

            Payment payment = new Payment();
            payment.setMethod(method);
            payment.setAmount(amount);
            payment.setDate(date);
            dao.insertPayment(payment);

            if (saveMethod) {
                HttpSession session = request.getSession();
                session.setAttribute("savedPaymentMethod", method);
            }

            response.sendRedirect("PaymentSuccess.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("payment.jsp?error=true");
        }
    }
}
