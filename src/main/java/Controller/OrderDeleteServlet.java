package Controller;

import Model.Order;
import Model.dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/orders/delete")
public class OrderDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("db") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int id = Integer.parseInt(req.getParameter("id"));
        DAO db = (DAO) session.getAttribute("db");
        try {
            db.Orders().delete(new Order(id, 0, null, 0, null, null));
            resp.sendRedirect(req.getContextPath() + "/orders");
        } catch (SQLException e) {
            throw new ServletException("Unable to delete order #" + id, e);
        }
    }
}
