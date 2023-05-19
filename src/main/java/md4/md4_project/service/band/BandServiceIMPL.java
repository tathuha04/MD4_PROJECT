package md4.md4_project.service.band;

import jdk.nashorn.internal.ir.SplitReturn;
import md4.md4_project.config.ConnectSQL;
import md4.md4_project.model.Band;
import md4.md4_project.model.Song;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BandServiceIMPL implements IBandService {
    private Connection connection = ConnectSQL.getConnection();
    private final String SELECT_ALL_BAND = "SELECT * FROM band";
    private final String DELETE_BY_ID = "DELETE FROM band where id=?";
    private final String INSERT_INTO_BAND = "INSERT INTO BAND (id, name, avatar) values (?, ?, ?,?)";

    @Override
    public void save(Band band) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_BAND);
            preparedStatement.setInt(1, band.getId());
            preparedStatement.setString(2, band.getName());
            preparedStatement.setString(3, band.getAvatar());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    @Override
    public List<Band> findAll() {
        List<Band> bandList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BAND);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                bandList.add(new Band(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getString("avatar")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return bandList;
    }

    @Override
    public Band findByName(String name) {
        List<Band> bandList = findAll();
        for (int i = 0; i < bandList.size(); i++) {
            if (bandList.get(i).getName().toLowerCase().contains(name.toLowerCase())) {
                return bandList.get(i);
            }
        }
        return null;
    }

    @Override
    public List<Song> showAllSongOfBand(String name) {
        return null;
    }

    @Override
    public void save(String name, String avatar) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_BAND);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, avatar);
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
