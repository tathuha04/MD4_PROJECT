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
        System.out.println("action tren doget --->"+action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreatSong(request, response);
                break;
//            case "songManager":
//                showSongManager(request, response);
//                break;
            case "songManager":
                showAllSong(request, response);
                break;
            case "page_grid":
                pageGridSong(request, response);
                break;
            case "detail":
                detailSong(request, response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                actionCreateSong(request, response);
                break;
            default:
        }
    }

    private void showSongManager(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/loginForm/songManager.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAllSong(HttpServletRequest request, HttpServletResponse response) {
        int pageNumber = 1;
        if (request.getParameter("page") != null) {
            pageNumber = Integer.parseInt(request.getParameter("page"));
        }

        System.out.println("pageNumber --->" + pageNumber);
        int elementOfPage = 6;
        int start = (pageNumber - 1) * elementOfPage;
        List<Song> songList = songService.findAll(start, elementOfPage);
        int totalElement = songService.getNoOfRecords();
        int sumOfPage = 1;
        if (totalElement > elementOfPage) {
            if (totalElement % elementOfPage == 0) {
                sumOfPage = (int) Math.ceil(totalElement / elementOfPage);
            } else {
                sumOfPage = (int) Math.ceil(totalElement / elementOfPage) + 1;
            }
        }
        request.setAttribute("listSong", songList);
        request.setAttribute("sumOfPage", sumOfPage);
        request.setAttribute("pageNumber", pageNumber);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/content/song/page.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void pageGridSong(HttpServletRequest request, HttpServletResponse response) {
        int pageNumber = 1;
        if (request.getParameter("page") != null) {
            pageNumber = Integer.parseInt(request.getParameter("page"));
        }
        System.out.println("pageNumber --->" + pageNumber);
        int elementOfPage = 6;
        int start = (pageNumber - 1) * elementOfPage;
        List<Song> songList = songService.findAll(start, elementOfPage);
        int totalElement = songService.getNoOfRecords();
        int sumOfPage = 0;
        if (totalElement > elementOfPage) {
            if (totalElement % elementOfPage == 0) {
                sumOfPage = (int) Math.ceil(totalElement / elementOfPage);
            } else {
                sumOfPage = (int) Math.ceil(totalElement / elementOfPage) + 1;
            }
        }
        request.setAttribute("listSong", songList);
        request.setAttribute("sumOfPage", sumOfPage);
        request.setAttribute("pageNumber", pageNumber);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/content/song/page.jsp");
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
        String avatar = request.getParameter("avatar");
        System.out.println(src);
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
        Song song = new Song(name, categoryId,listBandId,listSingerId,userId,avatar,src);
        songService.save(song,request);
       showAllSong(request, response);
    }

    private void detailSong(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        Song song = (Song) songService.findById(id);
        System.out.println(song.getSrc());
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/content/song/detail.jsp");
        request.setAttribute("song", song);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
