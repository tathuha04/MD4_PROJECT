package md4.md4_project.service.song;

import md4.md4_project.model.Song;

import java.util.List;

public interface ISongService<Song> {
    List<Song> findAll();
    void save(md4.md4_project.model.Song song);
    Song findById(int id);
    void deleteById(int id);
}
