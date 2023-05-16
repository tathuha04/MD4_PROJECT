package md4.md4_project.service.category;

import md4.md4_project.model.Category;
import md4.md4_project.service.IGenericService;

public interface ICategoryService extends IGenericService<Category> {
    int getNoOfRecords();
}