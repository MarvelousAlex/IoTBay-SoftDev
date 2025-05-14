package Controller;

import Model.User;
import Model.dao.DAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Pattern;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        DAO db = (DAO) req.getSession().getAttribute("db");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            User user = db.Users().getUserByEmailAndPassword(email, password);
            req.getSession().setAttribute("loggedInUser", user);
            System.out.println(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("Welcome.jsp");
    }
}
