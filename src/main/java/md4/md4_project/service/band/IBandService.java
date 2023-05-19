package md4.md4_project.service.band;

import md4.md4_project.model.Band;
import md4.md4_project.model.Song;

import java.util.List;

public interface IBandService {
    List<Band> findAll();
    Band findByName(String name);
    List<Song> showAllSongOfBand(String name);

    void save(String name, String avatar);

    void deleteById(int id);
}
