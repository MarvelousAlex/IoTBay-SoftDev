package Controller;

import Model.Order;
import Model.dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/orders/create")
public class OrderCreateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // show empty form
        req.getRequestDispatcher("/orderForm.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("db") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        int customerId = ((Model.User) session
                .getAttribute("loggedInUser")).getId();
        String product   = req.getParameter("product");
        int quantity     = Integer.parseInt(req.getParameter("quantity"));
        String orderDate = req.getParameter("orderDate");
        String status    = req.getParameter("status");

        DAO db = (DAO) session.getAttribute("db");
        try {
            db.Orders().add(
                    new Order(customerId, product, quantity, orderDate, status)
            );
            resp.sendRedirect(req.getContextPath() + "/orders");
        } catch (SQLException e) {
            throw new ServletException("Unable to create order", e);
        }
    }
}
