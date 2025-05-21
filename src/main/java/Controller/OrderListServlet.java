package Controller;

import Model.Order;

import Model.Order;
import Model.dao.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/orders")
public class OrderListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 1) Auth check
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("db") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        // 2) Read filter parameters from the query string
        String idParam   = req.getParameter("id");
        String fromDate  = req.getParameter("fromDate");
        String toDate    = req.getParameter("toDate");

        try {
            DAO db = (DAO) session.getAttribute("db");
            List<Order> orders;

            // 3) If any filter is supplied, use filter(); otherwise getAll()
            boolean hasId    = idParam   != null && !idParam.isEmpty();
            boolean hasFrom  = fromDate  != null && !fromDate.isEmpty();
            boolean hasTo    = toDate    != null && !toDate.isEmpty();

            if (hasId || hasFrom || hasTo) {
                Integer id = hasId ? Integer.valueOf(idParam) : null;
                orders = db.Orders().filter(id, fromDate, toDate);
            } else {
                orders = db.Orders().getAll();
            }

            // 4) Push the list into the request & forward
            req.setAttribute("orders", orders);
            req.getRequestDispatcher("/orderList.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException("Unable to load orders", e);
        }
    }
}
