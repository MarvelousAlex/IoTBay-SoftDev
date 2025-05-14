package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Model.User;
import Model.dao.DAO;
import Model.dao.DBManager;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("loggedInUser");
        DAO db = (DAO)session.getAttribute("db");

        try {
            db.Users().delete(user);
        } catch (SQLException e) {
            System.out.format("Failed to remove %s from the database", user.getEmail());
            e.printStackTrace();
        }
        session.removeAttribute("loggedInUser");
        resp.sendRedirect("landing.jsp");
    }
}


//@WebServlet("/DeleteServlet")
//public class DeleteServlet extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HttpSession session = req.getSession();
//        User user = (User)session.getAttribute("loggedInUser");
//        DBManager db = (DBManager)session.getAttribute("db");
//
//        try {
//            db.removeUser(user);
//        } catch (SQLException e) {
//            System.out.format("Failed to %s from the database", user.getEmail());
//        }
//        session.removeAttribute("loggedInUser");
//        resp.sendRedirect("index.jsp");
//    }
//}