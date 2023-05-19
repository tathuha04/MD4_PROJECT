package md4.md4_project.service.playlist;

import md4.md4_project.config.ConnectSQL;
import md4.md4_project.model.Playlist;
import md4.md4_project.model.User;
import md4.md4_project.service.user.IUserService;
import md4.md4_project.service.user.UserServiceIMPL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlaylistServiceIMPL implements IPlaylistService {
    private Connection connection = ConnectSQL.getConnection();
    IUserService userService = new UserServiceIMPL();
    private final String FIND_ALL_PLAYLIST = "SELECT * FROM PLAYLIST";
    private final String CREATE_PLAYLIST="INSERT INTO PLAYLIST(name,user_id,status,avatar) value(?,?,?,?)";
    private final String FIND_PLAYLIST_BY_ID="SELECT * FROM PLAYLIST WHERE ID =?";
    private final String DELETE_PLAYLIST_BY_ID="DELETE PLAYLIST WHERE ID =?";
    private final String FIND_ALL_PLAYLIST_BY_USER_ID="SELECT * FROM PLAYLIST WHERE USER_ID=?";

    @Override
    public List findAll() {
        List<Playlist> playlists = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_PLAYLIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                playlists.add(new Playlist(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getInt("user_id"), resultSet.getByte("status"), resultSet.getString("avatar")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return playlists;
    }

    @Override
    public void save(Playlist playlist) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_PLAYLIST, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, playlist.getPlaylistName());
            preparedStatement.setInt(2, playlist.getUserId());
            preparedStatement.setByte(3,playlist.getStatus());
            preparedStatement.setString(4,playlist.getAvatar());
            preparedStatement.executeUpdate();
            int id = 0;
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt(1);
            }
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Playlist findById(int id) {
      Playlist playlist = new Playlist();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_PLAYLIST_BY_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                playlist=new Playlist(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getInt("user_id"), resultSet.getByte("status"), resultSet.getString("avatar"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return playlist;
    }

    @Override
    public void deleteById(int id) {
        try {
            connection.setAutoCommit(false);
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PLAYLIST_BY_ID);
            preparedStatement.setInt(1,id);
            connection.commit();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Playlist> findAllPlaylistByUserId(int id) {
        List<Playlist> playlists = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_PLAYLIST_BY_USER_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                playlists.add(new Playlist(resultSet.getInt("id"), resultSet.getString("name"), resultSet.getInt("user_id"), resultSet.getByte("status"), resultSet.getString("avatar")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return playlists;
    }
}
