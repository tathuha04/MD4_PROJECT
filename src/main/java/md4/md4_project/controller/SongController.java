package md4.md4_project.controller;

import md4.md4_project.model.Song;
import md4.md4_project.model.User;
import md4.md4_project.service.band.BandServiceIMPL;
import md4.md4_project.service.band.IBandService;
import md4.md4_project.service.category.CategoryServiceIMPL;
import md4.md4_project.service.category.ICategoryService;
import md4.md4_project.service.singer.ISingerService;
import md4.md4_project.service.singer.SingerServiceIMPL;
import md4.md4_project.service.song.ISongService;
import md4.md4_project.service.song.SongServiceIMPL;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(value = "/song")
public class SongController extends HttpServlet {
    IBandService bandService = new BandServiceIMPL();
    ICategoryService categoryService = new CategoryServiceIMPL();
    ISingerService singerService = new SingerServiceIMPL();
    ISongService songService = new SongServiceIMPL();
    IUserService userService = new UserServiceIMPL();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "creat":
                showFormCreatSong(request, response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "creat":
                actionCreateSong(request, response);
                break;

        }
    }

    private void showAllSong(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/loginForm/allSong.jsp");
        request.setAttribute("listSong", songService.findAll());
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormCreatSong(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/content/song/creatSong.jsp");
        request.setAttribute("categories", categoryService.findAll());
        request.setAttribute("listBand", bandService.findAll());
        request.setAttribute("listSinger", singerService.findAll());
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionCreateSong(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String src = request.getParameter("audio");
        int categoryId = Integer.parseInt(request.getParameter("categories"));

        String[] bandIdStr = request.getParameterValues("listBand");
        int[] bandIds = new int[bandIdStr.length];
        for (int i = 0; i < bandIdStr.length; i++) {
            bandIds[i] = Integer.parseInt(bandIdStr[i]);
        }
        List<Integer> listBandId = new ArrayList<>();
        for (int i = 0; i < bandIds.length; i++) {
            listBandId.add(Integer.valueOf(bandIds[i]));
        }
        String[] singerIdStr = request.getParameterValues("listSinger");
        int[] singerIds = new int[singerIdStr.length];
        for (int i = 0; i < singerIdStr.length; i++) {
            singerIds[i] = Integer.parseInt(singerIdStr[i]);
        }
        List<Integer> listSingerId = new ArrayList<>();
        for (int i = 0; i < singerIds.length; i++) {
            listSingerId.add(Integer.valueOf(singerIds[i]));
        }
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        int userId = user.getId();
        Song song = new Song(name, categoryId, listBandId, listSingerId, userId,src);
        songService.save(song);
        showFormCreatSong(request, response);
    }
}
