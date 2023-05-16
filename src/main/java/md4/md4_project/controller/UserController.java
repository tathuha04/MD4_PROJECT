package md4.md4_project.controller;

import md4.md4_project.model.Role;
import md4.md4_project.model.User;
import md4.md4_project.model.UserRole;
import md4.md4_project.service.role.IRoleService;
import md4.md4_project.service.role.RoleServiceIMPL;
import md4.md4_project.service.user.IUserService;
import md4.md4_project.service.user.UserServiceIMPL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@WebServlet(value = "/user")
public class UserController extends HttpServlet {
    private IRoleService roleService = new RoleServiceIMPL();
    private IUserService userService = new UserServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register":
                showFormRegister(req, resp);
                break;
            case "login":
                showFormLogin(req,resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register":
                actionRegister(req, resp);
                break;
            case "login":
                actionLogin(req,resp);
                break;
        }
    }

    private void showFormRegister(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/login_form/register.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionRegister(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = "admin";
        String role2 = "pm";
        Set<String> strRole = new HashSet<>();
        strRole.add(role);
        strRole.add(role2);
        Set<Role> roleSet = new HashSet<>();
        strRole.forEach(role1 -> {
            switch (role1) {
                case "admin":
                    roleSet.add(roleService.findByName(UserRole.ADMIN));
                    break;
                case "pm":
                    roleSet.add(roleService.findByName(UserRole.PM));
                    break;
                default:
                    roleSet.add(roleService.findByName(UserRole.USER));
            }
        });
        if (userService.existedByUsername(username)) {
            request.setAttribute("validate", "The username is existed!");
            request.setAttribute("name", name);
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            showFormRegister(request, response);
        } else if (userService.existedByEmail(email)) {
            request.setAttribute("validate", "The email is existed!");
            request.setAttribute("name", name);
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            showFormRegister(request, response);
        } else {
            User user = new User(name, username, password, roleSet);
            userService.save(user);
            request.setAttribute("validate", "Register success!");
            try {
                response.sendRedirect("/user?action=login");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private  void showFormLogin(HttpServletRequest request , HttpServletResponse response){
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/login_form/login.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void actionLogin(HttpServletRequest request, HttpServletResponse response){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userService.userLogin(username,password);
        if (user!=null){
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            try {
                response.sendRedirect("index.jsp");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }else {
            request.setAttribute("validate","Login failed! Please check your account!");
            showFormLogin(request,response);
        }
    }
}
