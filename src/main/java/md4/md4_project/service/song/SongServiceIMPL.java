package md4.md4_project.service.song;

import md4.md4_project.config.ConnectSQL;
import md4.md4_project.model.Playlist;
import md4.md4_project.model.Song;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SongServiceIMPL implements ISongService {
    private Connection connection = ConnectSQL.getConnection();
    private int totalElement;
    private final String SELECT_ALL_SONG = "SELECT * FROM SONG";
    private final String CREAT_NEW_SONG = "INSERT INTO SONG (name,category_Id,bandId,singerId,user_Id,avatar,src,artist) values(?,?,?,?,?,?,?,?)";
    private final String CREAT_NEW_SONG_1 = "INSERT INTO SONG (name,category_Id,bandId,user_Id,avatar,src,artist) values(?,?,?,?,?,?,?)";
    private final String CREAT_NEW_SONG_2 = "INSERT INTO SONG (name,category_Id,singerId,user_Id,avatar,src,artist) values(?,?,?,?,?,?,?)";
    private final String ADD_SONG_ID_TO_BAND = "INSERT INTO SONG_OF_BAND (songId,bandId) values (?,?)";
    private final String ADD_SONG_ID_TO_SINGER = "INSERT INTO SONG_OF_SINGER (songId,singerId) values (?,?)";
    private final String FIND_SONG_BY_ID = "SELECT * FROM SONG WHERE ID=?";
    private final String DELETE_SONG_BY_ID = "DELETE FROM SONG WHERE ID=?";
    private final String GET_ALL_SONG_ID_OF_PLAYLIST_BY_PL_ID = "SELECT * FROM SONG_OF_PLAYLIST WHERE PLAYLISTID=?";
    private final String UPDATE_VIEW_OF_SONG = "UPDATE SONG SET VIEW =? WHERE ID=?";
    private final String GET_VIEW_OF_SONG = "SELECT VIEW FROM SONG WHERE ID=?";
    private final String GET_TOP_VIEW_MUSIC="select * from song order by view desc limit 10";

    @Override
    public List findAll() {
        List<Song> songList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SONG);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Song song = new Song(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getInt("category_Id"), resultSet.getInt("user_id"), resultSet.getString("avatar"), resultSet.getString("src"),resultSet.getString("artist"));
                songList.add(song);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return songList;
    }

    @Override
    public void save(Song song, HttpServletRequest request) {

        PreparedStatement preparedStatement = null;
        try {
            connection.setAutoCommit(false);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (song.getBandId() == null) {
            try {

                preparedStatement = connection.prepareStatement(CREAT_NEW_SONG_2, Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, song.getName());
                preparedStatement.setInt(2, song.getCategoryId());
                preparedStatement.setString(3, song.getSingerId().toString());
                preparedStatement.setInt(4, song.getUserId());
                preparedStatement.setString(5, song.getAvatar());
                preparedStatement.setString(6, song.getSrc());
                preparedStatement.setString(7,song.getArtist());
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
                    preparedStatement2.executeUpdate();
                }
                connection.commit();
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
                preparedStatement.setString(5, song.getAvatar());
                preparedStatement.setString(6, song.getSrc());
                preparedStatement.setString(7,song.getArtist());

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
                connection.commit();
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
                preparedStatement.setString(6, song.getAvatar());
                preparedStatement.setString(7, song.getSrc());
                preparedStatement.setString(8,song.getArtist());

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
            while (resultSet.next()) {
                song = new Song(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getInt("category_Id"), resultSet.getInt("user_id"), resultSet.getString("avatar"), resultSet.getString("src"),resultSet.getString("artist"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return song;
    }

    @Override
    public void deleteById(int id) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_SONG_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Song> findAll(int start, int elementOfPage) {
        List<Song> songList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            String PAGE_SONG = "SELECT SQL_CALC_FOUND_ROWS * FROM song LIMIT " + start + "," + elementOfPage;
            ResultSet resultSet = statement.executeQuery(PAGE_SONG);
            while (resultSet.next()) {
                Song song = new Song();
                song.setId(resultSet.getInt("id"));
                song.setName(resultSet.getString("name"));
                song.setAvatar(resultSet.getString("avatar"));
                song.setSrc(resultSet.getString("src"));
                song.setArtist(resultSet.getString("artist"));
                songList.add(song);
            }
            resultSet = statement.executeQuery("SELECT FOUND_ROWS()");
            if (resultSet.next()) {
                this.totalElement = resultSet.getInt(1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return songList;
    }

    public int getNoOfRecords() {
        return totalElement;
    }

    @Override
    public List<Song> findAllSongOfPlaylistByPlaylistId(int id) {
        List<Song> songList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_SONG_ID_OF_PLAYLIST_BY_PL_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idSong = resultSet.getInt("songId");
                songList.add(findById(idSong));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return songList;
    }

    public void updateView(Song song) {
        int id = song.getId();
        int view = 0;
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(GET_VIEW_OF_SONG);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                view = resultSet.getInt("view");
            }
            PreparedStatement preparedStatement1 = connection.prepareStatement(UPDATE_VIEW_OF_SONG);
            preparedStatement1.setInt(1, (view + 1));
            preparedStatement1.setInt(2, id);
            preparedStatement1.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Song> showTopSong() {
        List<Song> songList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_TOP_VIEW_MUSIC);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Song song = new Song(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getInt("category_Id"), resultSet.getInt("user_id"), resultSet.getString("avatar"), resultSet.getString("src"),resultSet.getString("artist"));
                songList.add(song);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return songList;
    }

}


