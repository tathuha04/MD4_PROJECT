package md4.md4_project.service.category;

import md4.md4_project.model.Category;
import md4.md4_project.service.IGenericService;

import java.util.List;

public interface ICategoryService extends IGenericService<Category> {
    int getNoOfRecords();

    List<Category> findAll();

    void updateCategory(int id, String name, String avatar);
}