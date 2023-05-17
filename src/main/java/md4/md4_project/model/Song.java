package md4.md4_project.model;

import java.util.ArrayList;
import java.util.List;

public class Song {
    private int id;
    private String name;
    private List<Singer> singers;
    private Category category;
    private List<Band> brands;
    private User user;
    private int numberOfView;
    private List<User> likeUser= new ArrayList<>();
    private List<Comment> comments;

    public Song() {
    }

    public Song(int id, String name, List<Singer> singers, Category category, List<Band> brands, User user, int numberOfView, List<User> likeUser, List<Comment> comments) {
        this.id = id;
        this.name = name;
        this.singers = singers;
        this.category = category;
        this.brands = brands;
        this.user = user;
        this.numberOfView = numberOfView;
        this.likeUser = likeUser;
        this.comments = comments;
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

    public List<Singer> getSingers() {
        return singers;
    }

    public void setSingers(List<Singer> singers) {
        this.singers = singers;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Band> getBrands() {
        return brands;
    }

    public void setBrands(List<Band> brands) {
        this.brands = brands;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getNumberOfView() {
        return numberOfView;
    }

    public void setNumberOfView(int numberOfView) {
        this.numberOfView = numberOfView;
    }

    public List<User> getLikeUser() {
        return likeUser;
    }

    public void setLikeUser(List<User> likeUser) {
        this.likeUser = likeUser;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
}
