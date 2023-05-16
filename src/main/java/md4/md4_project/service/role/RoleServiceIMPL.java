package md4.md4_project.service.role;

import md4.md4_project.config.ConnectSQL;
import md4.md4_project.model.Role;
import md4.md4_project.model.UserRole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleServiceIMPL implements IRoleService{
    private Connection connection = ConnectSQL.getConnection();
    private final String FIND_BY_NAME_ROLE = "SELECT * FROM role WHERE name=?;";
    @Override
    public Role findByName(UserRole name) {
        Role role = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NAME_ROLE);
            preparedStatement.setString(1,String.valueOf(name));
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                role = new Role(id,name);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return role;
    }
}
