package md4.md4_project.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectSQL {
    private static Connection connection;
    private static final String URL = System.getenv("URL");
    private static final String USER = System.getenv("USER");
    private static final String PASSWORD = System.getenv("PASSWORD");

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL,USER,PASSWORD);
            System.out.println("ket noi thanh cong");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("thất bại");
            throw new RuntimeException(e);
        }
        return connection;
    }

}
