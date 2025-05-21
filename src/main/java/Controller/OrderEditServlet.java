package Controller;

import Model.Order;
import Model.dao.DAO;
import com.mycompany.beans.OrderBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/orders/edit")
public class OrderEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("db") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        int id = Integer.parseInt(req.getParameter("id"));
        try {
            // 1) load the Model.Order
            DAO db = (DAO) session.getAttribute("db");
            Model.Order order = db.Orders().get(new Model.Order(id,0,null,0,null,null));

            // 2) stick that same Model.Order into the request
            req.setAttribute("order", order);

            // 3) forward to the form
            req.getRequestDispatcher("/orderForm.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException("Unable to load order #" + id, e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("db") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int id           = Integer.parseInt(req.getParameter("id"));
        String product   = req.getParameter("product");
        int quantity     = Integer.parseInt(req.getParameter("quantity"));
        String orderDate = req.getParameter("orderDate");
        String status    = req.getParameter("status");

        DAO db = (DAO) session.getAttribute("db");
        try {
            Order oldO = new Order(id, 0, null, 0, null, null);
            Order newO = new Order(id, oldO.getCustomerId(),
                    product, quantity, orderDate, status);
            db.Orders().update(oldO, newO);
            resp.sendRedirect(req.getContextPath() + "/orders");
        } catch (SQLException e) {
            throw new ServletException("Unable to update order #" + id, e);
        }
    }
}
