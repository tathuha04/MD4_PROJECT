package md4.md4_project.service.playlist;

import md4.md4_project.model.Playlist;

import java.util.List;

public interface IPlaylistService <Playlist> {
    List<md4.md4_project.model.Playlist> findAll();


    void save(md4.md4_project.model.Playlist playlist);

    Playlist findById(int id);
    void deleteById(int id);
}
