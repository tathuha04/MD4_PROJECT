package md4.md4_project.model;



import java.util.ArrayList;
import java.util.List;

public class Song {
    private int id;
    private String name;
    private List<Integer> singerId;
    private int categoryId;
    private List<Integer> bandId;
    private int userId;
    private int numberOfView;
    private String avatar;
    private String src;
    private List<Integer> likeUserId=new ArrayList<>();
    private List<Integer> commentId;



    public Song() {
    }

    public Song(int id, String name, List<Integer> singerId, int categoryId, List<Integer> bandId, int userId, int numberOfView, List<Integer> likeUserId, List<Integer> commentId) {
        this.id = id;
        this.name = name;
        this.singerId = singerId;
        this.categoryId = categoryId;
        this.bandId = bandId;
        this.userId = userId;
        this.numberOfView = numberOfView;
        this.likeUserId = likeUserId;
        this.commentId = commentId;
    }

    public Song(int id, String name, int categoryId, int userId) {
        this.id = id;
        this.name = name;
        this.categoryId = categoryId;
        this.userId = userId;

    }

    public Song(String name, int categoryId, List<Integer> bandId, List<Integer> singerId, int userId) {
        this.name = name;
        this.singerId = singerId;
        this.categoryId = categoryId;
        this.bandId = bandId;
        this.userId = userId;
    }

    public Song(int id, String name, List<Integer> singerId, int categoryId, List<Integer> bandId, int userId, int numberOfView, String avatar, String src, List<Integer> likeUserId, List<Integer> commentId) {
        this.id = id;
        this.name = name;
        this.singerId = singerId;
        this.categoryId = categoryId;
        this.bandId = bandId;
        this.userId = userId;
        this.numberOfView = numberOfView;
        this.avatar = avatar;
        this.src = src;
        this.likeUserId = likeUserId;
        this.commentId = commentId;
    }

    public Song(String name, int categoryId, List<Integer> bandId, List<Integer> singerId, int userId, String src) {
        this.name = name;
        this.singerId = singerId;
        this.categoryId = categoryId;
        this.bandId = bandId;
        this.userId = userId;
        this.src = src;
    }

    public Song(int id, String name, int categoryId, int userId, String src) {
        this.id = id;
        this.name = name;
        this.categoryId = categoryId;
        this.userId = userId;
        this.src = src;
    }


    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
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

    public List<Integer> getSingerId() {
        return singerId;
    }

    public void setSingerId(List<Integer> singerId) {
        this.singerId = singerId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public List<Integer> getBandId() {
        return bandId;
    }

    public void setBandId(List<Integer> bandId) {
        this.bandId = bandId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getNumberOfView() {
        return numberOfView;
    }

    public void setNumberOfView(int numberOfView) {
        this.numberOfView = numberOfView;
    }

    public List<Integer> getLikeUserId() {
        return likeUserId;
    }

    public void setLikeUserId(List<Integer> likeUserId) {
        this.likeUserId = likeUserId;
    }

    public List<Integer> getCommentId() {
        return commentId;
    }

    public void setCommentId(List<Integer> commentId) {
        this.commentId = commentId;
    }
}
