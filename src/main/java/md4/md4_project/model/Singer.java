package md4.md4_project.model;

public class Singer {
    int id;
    String name;
    String avatar= "https://firebasestorage.googleapis.com/v0/b/projectmd4-deb2e.appspot.com/o/avatardefault.png?alt=media&token=741b462a-a9f6-40fe-a7c6-8c3550650c9c";

    public Singer() {
    }

    public Singer(int id, String name, String avatar) {
        this.id = id;
        this.name = name;
        this.avatar = avatar;
    }

    public Singer(int id, String name) {
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

    @Override
    public String toString() {
        return "Singer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", avatar='" + avatar + '\'' +
                '}';
    }
}
