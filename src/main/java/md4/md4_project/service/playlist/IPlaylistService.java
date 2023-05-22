package md4.md4_project.service.playlist;

import md4.md4_project.model.Playlist;
import md4.md4_project.model.Song;
import md4.md4_project.service.IGenericService;

import java.util.List;

public interface IPlaylistService extends IGenericService<Playlist> {
    List<md4.md4_project.model.Playlist> findAll();


    void save(md4.md4_project.model.Playlist playlist);

    Playlist findById(int id);
    void deleteById(int id);
    List<md4.md4_project.model.Playlist> findAllPlaylistByUserId(int id);
    void addSongToPlaylist(int playlistId,List<Integer> songId);
    void removeSongToPlaylist(int playlistId,List<Integer> songId);
}
