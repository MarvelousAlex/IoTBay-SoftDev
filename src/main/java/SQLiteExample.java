import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.SQLException;

public class SQLiteExample {

    /**
     * Connect to a sample SQLite database
     */
    public static void connect() {
        // SQLite connection string (the database file will be created if it does not exist)
        String url = "jdbc:sqlite:sample.db";  // You can provide a full file path if desired

        try (Connection conn = DriverManager.getConnection(url)) {
            if (conn != null) {
                System.out.println("Connection to SQLite established.");

                // Create a sample table if it doesn't exist
                String sqlCreateTable = "CREATE TABLE IF NOT EXISTS users ("
                        + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                        + "name TEXT NOT NULL, "
                        + "email TEXT UNIQUE NOT NULL"
                        + ");";

                try (Statement stmt = conn.createStatement()) {
                    stmt.execute(sqlCreateTable);
                    System.out.println("Table 'users' is ready.");
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        connect();
    }
}