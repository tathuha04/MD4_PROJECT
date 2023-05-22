package md4.md4_project.service.singer;

import md4.md4_project.config.ConnectSQL;
import md4.md4_project.model.Singer;
import md4.md4_project.model.Song;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SingerServiceIMPL implements ISingerService {
    private Connection connection = ConnectSQL.getConnection();
    private final String SELECT_ALL_SINGER = "SELECT * from singer";

    private final String DELETE_SINGER_BY_ID= "DELETE from singer where id=? ";

    private final String INSERT_INTO_SINGER = "INSERT INTO SINGER (name, avatar) values (?,?)";
    private final String UPDATE_SINGER = "UPDATE SINGER SET name = ?, avatar= ? where id = ?";


    @Override
    public List<Singer> findAll() {
        List<Singer> listSinger = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SINGER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                listSinger.add(new Singer(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getString("avatar")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listSinger;
    }

    @Override
    public Singer findByName(String name) {
        List<Singer> singerList = findAll();
        for (int i = 0; i < singerList.size(); i++) {
            if (singerList.get(i).getName().toLowerCase().contains(name.toLowerCase())) {
                return singerList.get(i);
            }
        }
        return null;
    }

    @Override
    public List<Song> showAllSongOfSinger(String name) {
        return null;
    }

    @Override
    public Singer findById(int id) {
        List<Singer> singerList = findAll();
        for (int i = 0; i < singerList.size(); i++) {
            if (id == singerList.get(i).getId()) {
                return singerList.get(i);
            }
        }
        return null;
    }

    @Override
    public void deleteById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SINGER_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    public void save(String name, String avatar) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_SINGER);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, avatar);
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void edit(int id, String name, String avatar) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SINGER);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, avatar);
            preparedStatement.setInt(3, id);
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



}
