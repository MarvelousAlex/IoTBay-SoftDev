package Controller;

import Model.User;
import Model.dao.DAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Pattern;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    // simple email‐pattern check
    private static final Pattern EMAIL_PATTERN =
            Pattern.compile("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // just show the registration form
        req.getRequestDispatcher("Register.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        DAO db = (DAO) req.getSession().getAttribute("db");
        if (db == null) {
            System.out.println("1");
            req.setAttribute("error", "Database access unavailable.");
            doGet(req, resp);

            return;
        }

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        boolean tos = req.getParameter("tos") != null;

        if (!tos) {
            System.out.println("2");
            req.setAttribute("error", "You must agree to the terms.");
            doGet(req, resp);
            return;
        }
        if (!EMAIL_PATTERN.matcher(email).matches()) {
            System.out.println("3");
            req.setAttribute("error", "Please enter a valid email address.");
            doGet(req, resp);
            return;
        }
        if (password == null || password.length() < 6) {
            System.out.println("4");
            req.setAttribute("error", "Password must be at least 6 characters.");
            doGet(req, resp);
            return;
        }
        if (name == null || name.trim().isEmpty()) {
            System.out.println("5");
            req.setAttribute("error", "Name cannot be empty.");
            doGet(req, resp);
            return;
        }

        User user = new User(email, password, name);

        try {
            User existingUser = db.Users().findByEmail(email);
            if (existingUser != null) {
                System.out.println("7");
                req.setAttribute("error", "Email already registered. Please use another.");
                doGet(req, resp);
                return;
            }

            User savedUser = db.Users().add(user); // This calls your add method
            HttpSession session = req.getSession();
            session.setAttribute("loggedInUser", savedUser);
            resp.sendRedirect(req.getContextPath() + "/Welcome.jsp");
            return;
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Registration failed. Try again.");
            doGet(req, resp);
        }
    }
}