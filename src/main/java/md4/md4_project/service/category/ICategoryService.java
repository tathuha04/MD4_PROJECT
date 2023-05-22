package md4.md4_project.service.category;

import md4.md4_project.model.Category;
import md4.md4_project.service.IGenericService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ICategoryService extends IGenericService<Category> {
    void save(String name, String avatar);

    int getNoOfRecords();

    List<Category> findAll();

    void updateCategory(int id, String name, String avatar);
    void deleteCategory(int id);
}