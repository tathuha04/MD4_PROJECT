package md4.md4_project.service.song;

import md4.md4_project.model.Song;
import md4.md4_project.service.IGenericService;

import java.util.List;

public interface ISongService extends IGenericService<Song> {
    List<Song> findAll();
    int getNoOfRecords();
    List<md4.md4_project.model.Song> findAllSongOfPlaylistByPlaylistId(int id);
}
