package md4.md4_project.model;

public class Playlist {
    private int id;
    private String playlistName;
    private int userId;
    private byte status = 0;
    private String avatar;

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Playlist() {
    }

    public Playlist(int id, String playlistName, int userId, byte status, String avatar) {
        this.id = id;
        this.playlistName = playlistName;
        this.userId = userId;
        this.status = status;
        this.avatar = avatar;
    }

    public Playlist(int id, String playlistName, int userId, byte status) {
        this.id = id;
        this.playlistName = playlistName;
        this.userId = userId;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlaylistName() {
        return playlistName;
    }

    public void setPlaylistName(String playlistName) {
        this.playlistName = playlistName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }
}
