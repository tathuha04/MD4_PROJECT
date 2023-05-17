package md4.md4_project.controller;

import md4.md4_project.model.Singer;
import md4.md4_project.service.singer.ISingerService;
import md4.md4_project.service.singer.SingerServiceIMPL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet( value = "/singers")
public class SingerController extends HttpServlet {
    ISingerService singerService = new SingerServiceIMPL();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "singer":
                showListSinger(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public void showListSinger(HttpServletRequest request, HttpServletResponse response){
        List<Singer> singerList = singerService.findAll();
        request.setAttribute("singerList", singerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/singer/listSinger.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
