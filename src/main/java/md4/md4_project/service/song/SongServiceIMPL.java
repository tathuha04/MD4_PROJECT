package md4.md4_project.service.song;

import md4.md4_project.config.ConnectSQL;
import md4.md4_project.model.Song;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongServiceIMPL implements ISongService {
    private Connection connection = ConnectSQL.getConnection();
    private final String SELECT_ALL_SONG = "SELECT * FROM SONG";
    private final String CREAT_NEW_SONG = "INSERT INTO SONG (name,category_Id,bandId,singerId,user_Id) values(?,?,?,?,?)";
    private final String CREAT_NEW_SONG_1 = "INSERT INTO SONG (name,category_Id,bandId,user_Id) values(?,?,?,?)";
    private final String CREAT_NEW_SONG_2 = "INSERT INTO SONG (name,category_Id,singerId,user_Id) values(?,?,?,,?)";
    private final String ADD_SONG_ID_TO_BAND = "INSERT INTO SONG_OF_BAND (songId,bandId) values (?,?)";
    private final String ADD_SONG_ID_TO_SINGER = "INSERT INTO SONG_OF_SINGER (songId,singerId) values (?,?)";
    private final String FIND_SONG_BY_ID="SELECT * FROM SONG WHERE ID=?";
    private final String DELETE_SONG_BY_ID="";

    @Override
    public List findAll() {
        List<Song> songList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SONG);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Song song = new Song(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getInt("category_Id"), resultSet.getInt("user_id"));
                songList.add(song);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return songList;
    }

    @Override
    public void save(Song song) {
        PreparedStatement preparedStatement = null;
        if (song.getBandId() == null) {
            try {
                connection.setAutoCommit(false);
                preparedStatement = connection.prepareStatement(CREAT_NEW_SONG_2, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, song.getName());
                preparedStatement.setInt(2, song.getCategoryId());
                preparedStatement.setString(3, song.getSingerId().toString());
                preparedStatement.setInt(4, song.getUserId());
                preparedStatement.executeUpdate();
                int id = 0;
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                while (resultSet.next()) {
                    id = resultSet.getInt(1);
                }

                PreparedStatement preparedStatement2 = connection.prepareStatement(ADD_SONG_ID_TO_SINGER);
                List<Integer> listSingerId = song.getSingerId();
                for (int i = 0; i < listSingerId.size(); i++) {
                    preparedStatement2.setInt(1, id);
                    preparedStatement2.setInt(2, listSingerId.get(i));
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (song.getSingerId() == null) {
            try {
                 connection.setAutoCommit(false);
                preparedStatement = connection.prepareStatement(CREAT_NEW_SONG_1, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, song.getName());
                preparedStatement.setInt(2, song.getCategoryId());
                preparedStatement.setString(3, song.getBandId().toString());
                preparedStatement.setInt(4, song.getUserId());
                preparedStatement.executeUpdate();
                int id = 0;
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                while (resultSet.next()) {
                    id = resultSet.getInt(1);
                }
                PreparedStatement preparedStatement1 = connection.prepareStatement(ADD_SONG_ID_TO_BAND);
                List<Integer> listBandId = song.getBandId();
                for (int i = 0; i < listBandId.size(); i++) {
                    preparedStatement1.setInt(1, id);
                    preparedStatement1.setInt(2, listBandId.get(i));
                }

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {

                connection.setAutoCommit(false);
                preparedStatement = connection.prepareStatement(CREAT_NEW_SONG, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, song.getName());
                preparedStatement.setInt(2, song.getCategoryId());
                preparedStatement.setString(3, song.getSingerId().toString());
                preparedStatement.setString(4, song.getBandId().toString());
                preparedStatement.setInt(5, song.getUserId());
                preparedStatement.executeUpdate();
                int id = 0;
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                while (resultSet.next()) {
                    id = resultSet.getInt(1);
                }
                PreparedStatement preparedStatement1 = connection.prepareStatement(ADD_SONG_ID_TO_BAND);
                List<Integer> listBandId = song.getBandId();
                for (int i = 0; i < listBandId.size(); i++) {
                    preparedStatement1.setInt(1, id);
                    preparedStatement1.setInt(2, listBandId.get(i));
                    preparedStatement1.executeUpdate();
                }
                PreparedStatement preparedStatement2 = connection.prepareStatement(ADD_SONG_ID_TO_SINGER);
                List<Integer> listSingerId = song.getSingerId();
                for (int i = 0; i < listSingerId.size(); i++) {
                    preparedStatement2.setInt(1, id);
                    preparedStatement2.setInt(2, listSingerId.get(i));
                    preparedStatement2.executeUpdate();
                }
                connection.commit();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }


    }


    @Override
    public Song findById(int id) {
        Song song = new Song();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_SONG_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                 song = new Song(resultSet.getInt("id"),resultSet.getString("name"),resultSet.getInt("category_id"),resultSet.getInt("user_id"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return song;
    }

    @Override
    public void deleteById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SONG_BY_ID);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
