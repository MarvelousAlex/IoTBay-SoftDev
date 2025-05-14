package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Model.User;
import Model.dao.DAO;
import java.io.IOException;
import java.sql.SQLException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        DAO db = (DAO)session.getAttribute("db");

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String name = req.getParameter("name");

        User existingUser = (User)session.getAttribute("loggedInUser");
        User newUser = new User(email, password, name);     // here!!

        try {
            db.Users().update(existingUser, newUser);
            session.setAttribute("loggedInUser", newUser);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("Welcome.jsp");
    }
}