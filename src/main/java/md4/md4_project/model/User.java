package md4.md4_project.model;

import java.util.HashSet;
import java.util.Set;

public class User {
    private int id;
    private String name;
    private String username;
    private String email;
    private String password;
    private byte status;
    private String avatar = "https://firebasestorage.googleapis.com/v0/b/tathuha-2045b.appspot.com/o/8f20c28b-cc56-49ed-b93e-1f66d559d5af.jpg?alt=media&token=e4e7e80f-75a1-460f-a53a-5fbd147cf204";
    private Set<Role> roleSet = new HashSet<>();
    public User() {
    }

    public User(int id, String name, String username, String email, byte status) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.email = email;
        this.status = status;
    }

    public User(int id, String name, String avatar, Set<Role> roleSet) {
        this.id = id;
        this.name = name;
        this.avatar = avatar;
        this.roleSet = roleSet;
    }

    public User(String name, String username, String email, String password, Set<Role> roleSet) {
        this.name = name;
        this.username = username;
        this.email= email;
        this.password =password;
        this.roleSet = roleSet;
    }

    public User(int id, String name, String username, String email, String avatar) {
        this.id= id;
        this.name = name;
        this.username = username;
        this.email= email;
        this.avatar = avatar;
    }

    public Set<Role> getRoleSet() {
        return roleSet;
    }

    public void setRoleSet(Set<Role> roleSet) {
        this.roleSet = roleSet;
    }

    public User(int id, String name, String username, String email, String password, byte status, String avatar, Set<Role> roleSet) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.status = status;
        this.avatar = avatar;
        this.roleSet = roleSet;
    }



    public User(int id, String name, String username, String email, String password, byte status, String avatar) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.status = status;
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", status=" + status +
                ", avatar='" + avatar + '\'' +
                '}';
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

}
