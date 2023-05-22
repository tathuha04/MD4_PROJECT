package md4.md4_project.service.band;

import md4.md4_project.model.Band;
import md4.md4_project.model.Playlist;
import md4.md4_project.model.Song;

import java.util.List;

public interface IBandService {
    void save(Band band);
    List<Band> findAll();
    Band findByName(String name);
    List<Song> showAllSongOfBand(String name);
    Band findById(int id);
    void deleteById(int id);

    void save(String name, String avatar);

    void editById(String name, String avatar, int id);
}
