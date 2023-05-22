package md4.md4_project.service.home;

import md4.md4_project.model.Band;
import md4.md4_project.model.Song;

import java.util.List;

public interface IHomeService {
    List<Song> getListSongRandom(int numberRandom);

}
