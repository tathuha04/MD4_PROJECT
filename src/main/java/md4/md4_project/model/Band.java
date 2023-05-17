package md4.md4_project.model;


import java.util.List;

public class Band {
private int id;
private String name;
private String avatar= "https://firebasestorage.googleapis.com/v0/b/projectmd4-deb2e.appspot.com/o/avatardefault.png?alt=media&token=741b462a-a9f6-40fe-a7c6-8c3550650c9c";

private List<Song> songOfBand;

    public Band() {
    }

    public Band(int id, String name, String avatar) {
        this.id = id;
        this.name = name;
        this.avatar = avatar;
    }

    public Band(int id, String name, String avatar, List<Song> songOfBand) {
        this.id = id;
        this.name = name;
        this.avatar = avatar;
        this.songOfBand = songOfBand;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public List<Song> getSongOfBand() {
        return songOfBand;
    }

    public void setSongOfBand(List<Song> songOfBand) {
        this.songOfBand = songOfBand;
    }

    @Override
    public String toString() {
        return "Band{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", avatar='" + avatar + '\'' +
                ", songOfBand=" + songOfBand +
                '}';
    }
}
