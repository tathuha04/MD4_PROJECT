package md4.md4_project.controller;

import md4.md4_project.model.Role;
import md4.md4_project.model.Singer;
import md4.md4_project.model.User;
import md4.md4_project.model.UserRole;
import md4.md4_project.service.singer.ISingerService;
import md4.md4_project.service.singer.SingerServiceIMPL;
import md4.md4_project.service.user.IUserService;
import md4.md4_project.service.user.UserServiceIMPL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Set;

@WebServlet(value = "/singers")
public class SingerController extends HttpServlet {
    ISingerService singerService = new SingerServiceIMPL();
    IUserService userService = new UserServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println("action o DoGet--> "+ action);
        switch (action){

            case "singer":
                showListSinger(request, response);
                break;
            case "create":
                showFormCreate(request, response);
                break;
            case "delete":
                deleteSinger(request, response);
                break;
            case "back":
                backToAdmin(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                createSinger(request, response);
                break;
            case "update":
                updateSinger(request, response);
                break;
        }
    }

    public void showListSinger(HttpServletRequest request, HttpServletResponse response) {
        List<Singer> singerList = singerService.findAll();
        request.setAttribute("singerList", singerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/admin/singerAdmin.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteSinger(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));
        singerService.deleteById(id);
        showListSinger(request, response);
    }

    public void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/content/singer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void createSinger(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String avatar = request.getParameter("avatar");
        singerService.save(name, avatar);
        showListSinger(request, response);
    }
    public void updateSinger(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String avatar = request.getParameter("avatar");
        singerService.edit(id, name, avatar);
        showListSinger(request, response);
    }
    public void backToAdmin(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        RequestDispatcher dispatcher;
        if (user != null) {
            Set<Role> roleSet = userService.findRoleByUserId(user.getId());
            System.out.println(userService.findRoleByUserId(user.getId()));
            String roleName = String.valueOf(UserRole.USER);
            for (Role role : roleSet) {
                if (role.getId() == 3) {
                    System.out.println("3");
                    roleName = String.valueOf(UserRole.ADMIN);
                } else if ((role.getId() == 2) && (roleName == String.valueOf(UserRole.USER))) {
                    System.out.println("2");
                    roleName = String.valueOf(UserRole.PM);
                }
            }
            session.setAttribute("role", roleName);
            if (roleName.equals("USER")) {
                dispatcher = request.getRequestDispatcher("index.jsp");
            } else {
                dispatcher = request.getRequestDispatcher("/WEB-INF/admin/admin2.jsp");
            }
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }else{
            dispatcher = request.getRequestDispatcher("index.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
