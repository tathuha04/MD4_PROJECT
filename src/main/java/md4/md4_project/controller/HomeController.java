package md4.md4_project.controller;

import md4.md4_project.model.Song;
import md4.md4_project.service.home.HomeService;
import md4.md4_project.service.home.IHomeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/")
public class HomeController extends HttpServlet {
    private IHomeService homeService = new HomeService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("co chay vao day khong");
        List<Song> songList = homeService.getListSongRandom(3);
        System.out.println("songList"+songList);
        request.setAttribute("songrandom", songList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/home/index.jsp");
        requestDispatcher.forward(request,response);

    }
}
