package md4.md4_project.service.song;

import md4.md4_project.model.Song;
import md4.md4_project.service.IGenericService;

import java.util.List;

public interface ISongService extends IGenericService<Song> {
    List<Song> findAll();

    int getNoOfRecords();

    List<Song> findAllSongOfPlaylistByPlaylistId(int id);

    void updateView(Song song);
    List<Song> showTopSong();
}
