package md4.md4_project.service.category;

import md4.md4_project.config.ConnectSQL;
import md4.md4_project.model.Category;
import md4.md4_project.service.user.IUserService;
import md4.md4_project.service.user.UserServiceIMPL;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class CategoryServiceIMPL implements ICategoryService{
    Connection connection = ConnectSQL.getConnection();
    private int totalElement;
    IUserService userService = new UserServiceIMPL();
    private final String CREATE_CATEGORY = "INSERT INTO category(name, avatar) VALUES (?,?);";
    private final String FIND_ALL_CATEGORY = "SELECT * FROM CATEGORY";
    private final String UPDATE_CATEGORY = "UPDATE category set name =?, avatar =? where id =?";
    private  final String DELETE_CATEGORY = "DELETE from category where id =?";
    private final String INSERT_INTO_CATEGORY = "INSERT INTO category (name,avatar) values (?,?)";
    private final String UPDATE_BAND = "UPDATE band set name=?,avatar=? where id=?";
    @Override
    public void save(String name, String avatar) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CATEGORY);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,avatar);
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void save(Category category, HttpServletRequest request) {

    }

    @Override
    public void deleteById(int id) {

    }

    @Override
    public Category findById(int id) {

        return null;
    }

    @Override
    public List<Category> findAll(int start, int elementOfPage) {
        List<Category> list = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            String PAGE_CATEGORY = "SELECT SQL_CALC_FOUND_ROWS * FROM category LIMIT "+start+","+elementOfPage;
            ResultSet resultSet = statement.executeQuery(PAGE_CATEGORY);
            while (resultSet.next()){
                Category category = new Category();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                category.setAvatar(resultSet.getString("avatar"));
                list.add(category);
            }
            resultSet = statement.executeQuery("SELECT FOUND_ROWS()");
            if (resultSet.next()){
                this.totalElement = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }


    @Override
    public int getNoOfRecords() {
        return totalElement;
    }

    @Override
    public List<Category> findAll() {
        List<Category> categoryList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_CATEGORY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                category.setAvatar(resultSet.getString("avatar"));
                categoryList.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList;
    }

    @Override
    public void updateCategory(int id, String name, String avatar) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CATEGORY);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,avatar);
            preparedStatement.setInt(3,id);
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteCategory(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CATEGORY);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
