package md4.md4_project.service.role;

import md4.md4_project.model.Role;
import md4.md4_project.model.UserRole;

public interface IRoleService {
    Role findByName(UserRole name);
}
