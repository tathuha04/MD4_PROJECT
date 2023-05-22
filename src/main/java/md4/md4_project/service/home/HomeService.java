package md4.md4_project.service.home;

import md4.md4_project.config.ConnectSQL;
import md4.md4_project.model.Song;
import md4.md4_project.service.song.ISongService;
import md4.md4_project.service.song.SongServiceIMPL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HomeService implements IHomeService{
    Connection connection = ConnectSQL.getConnection();
    private ISongService songService = new SongServiceIMPL();
    private final String GET_SONG_RANDOM = "SELECT * FROM song order by rand() limit ?";
    @Override
    public List<Song> getListSongRandom(int numberRandom) {
        List<Song> songList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_SONG_RANDOM);
            preparedStatement.setInt(1,numberRandom);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                songList.add(songService.findById(id));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return songList;
    }

}
