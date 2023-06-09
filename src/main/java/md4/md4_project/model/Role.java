package md4.md4_project.model;

public class Role {
    private int id;
    private String name;

    public Role(int id, UserRole name) {
        this.id = id;
        this.name = String.valueOf(name);
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

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
