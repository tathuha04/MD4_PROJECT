package md4.md4_project.service.band;

import md4.md4_project.model.Band;
import md4.md4_project.model.Song;

import java.util.List;

public interface IBandService {
    void save(Band band);
    List<Band> findAll();
    Band findByName(String name);
    List<Song> showAllSongOfBand(String name);
<<<<<<< HEAD
    void deleteById(int id);

=======

    void save(String name, String avatar);

    void deleteById(int id);
>>>>>>> c7f6715468c6c712d59d99eadfaa8eb5472b5842
}
