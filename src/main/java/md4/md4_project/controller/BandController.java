package md4.md4_project.controller;

import md4.md4_project.model.Band;
import md4.md4_project.model.Role;
import md4.md4_project.model.User;
import md4.md4_project.model.UserRole;
import md4.md4_project.service.band.BandServiceIMPL;
import md4.md4_project.service.band.IBandService;
import md4.md4_project.service.user.IUserService;
import md4.md4_project.service.user.UserServiceIMPL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Set;

@WebServlet(value = "/band")
public class BandController extends HttpServlet {
    IBandService bandService = new BandServiceIMPL();
    IUserService userService = new UserServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
//        System.out.println("action o DoGet-->"+ action);
        switch (action) {
            case "showband":
                showBand(request, response);
                break;
            case "create":
                showFormCreate(request, response);
                break;
            case "delete":
                deleteBand(request, response);
                break;
            case "back":
                new SongController().backToAdmin(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("action o DoPost-->" + action);
        switch (action) {
            case "create":
                createBand(request, response);
                break;
            case "update":
                editBand(request, response);
                break;
        }

    }

    public void showBand(HttpServletRequest request, HttpServletResponse response) {
        List<Band> bandList = bandService.findAll();
        request.setAttribute("bandList", bandList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/admin/bandAdmin.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/band/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void createBand(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String avatar = request.getParameter("avatar");
        bandService.save(name, avatar);
        showBand(request, response);
    }

    public void deleteBand(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        bandService.deleteById(id);
        showBand(request, response);
    }

    public void editBand(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String avatar = request.getParameter("avatar");
        bandService.editById(name, avatar, id);
        showBand(request, response);
    }

    public void backToAdmin(HttpServletRequest request, HttpServletResponse response) {
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
