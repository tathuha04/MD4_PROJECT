package md4.md4_project.service.band;

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
}
