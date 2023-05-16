package md4.md4_project.service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IGenericService<T> {
    void save(T t,  HttpServletRequest request);
    void deleteById(int id);
    T findById(int id);
    List<T> findAll(int start, int total);
}
