package md4.md4_project.service.user;

import md4.md4_project.model.Band;
import md4.md4_project.service.band.BandServiceIMPL;
import md4.md4_project.service.band.IBandService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/band")
public class BandController extends HttpServlet {
    IBandService bandService = new BandServiceIMPL();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("goi do Get");
        String action = request.getParameter("action");
        System.out.println("action----> "+ action);
        switch (action){
            case "showband":
                showBand(request, response);
                break;
            case "delete":
                deleteById(request, response);
                break;
            case "create":
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public void showBand(HttpServletRequest request, HttpServletResponse response){
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
    public void deleteById(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        bandService.deleteById(id);
        showBand(request, response);
    }
}
