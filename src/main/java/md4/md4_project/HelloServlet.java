package md4.md4_project;

import md4.md4_project.config.ConnectSQL;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Connection connection = ConnectSQL.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into bang1(name) values (?);");
            preparedStatement.setString(1,"hà");
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void destroy() {
    }
}