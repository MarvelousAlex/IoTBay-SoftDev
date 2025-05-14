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

        String sql = "SELECT id, email, password, name FROM User WHERE email = ? AND password = ?";
        try (PreparedStatement ps = db.getConnection().prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = new User(
                            rs.getInt("id"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("name")
                    );
                    req.getSession().setAttribute("loggedInUser", user);
                    resp.sendRedirect(req.getContextPath() + "/Welcome.jsp");
                    return;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("error", "Invalid email or password.");
        doGet(req, resp);
    }
}
