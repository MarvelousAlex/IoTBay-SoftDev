package Controller;

import Model.AccessLog;
import Model.dao.DBManager;
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
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AccessLogServlet")
public class AccessLogServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String dateFilter = request.getParameter("date");

        List<AccessLog> logs = new ArrayList<>();

        String sql = "SELECT * FROM access_logs WHERE user_id = ?";
        if (dateFilter != null && !dateFilter.isEmpty()) {
            sql += " AND DATE(access_time) = ?";
        }

        try (Connection conn = new DBManager().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            if (dateFilter != null && !dateFilter.isEmpty()) {
                stmt.setString(2, dateFilter);
            }
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AccessLog log = new AccessLog();
                    log.setAccessTime(rs.getTimestamp("access_time"));
                    log.setAction(rs.getString("action"));
                    logs.add(log);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("logs", logs);
        request.getRequestDispatcher("access_logs.jsp").forward(request, response);
    }
}
