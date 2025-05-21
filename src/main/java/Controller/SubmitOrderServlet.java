package Controller;

import Model.Order;
import Model.dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/orders/submit")
public class SubmitOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session==null || session.getAttribute("db")==null) {
            resp.sendRedirect("login.jsp"); return;
        }
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            DAO db  = (DAO) session.getAttribute("db");
            Order oldO = db.Orders().get(new Order(id,0,null,0,null,null));
            Order newO = new Order(
                    oldO.getId(),
                    oldO.getCustomerId(),
                    oldO.getProduct(),
                    oldO.getQuantity(),
                    oldO.getOrderDate(),
                    "SUBMITTED"
            );
            db.Orders().update(oldO, newO);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        // redirect back to filtered list or all
        resp.sendRedirect(req.getContextPath() + "/orders");
    }
}
