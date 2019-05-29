package quiz.controller;

import com.google.gson.Gson;
import quiz.dao.ChartDao;
import quiz.dao.implement.ChartDaoImplement;
import quiz.service.ChartService;
import quiz.service.implement.ChartServiceImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ChartServlet",urlPatterns = "/chart")
public class ChartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        ChartDao chartDao = new ChartDaoImplement();
        ChartService chartService = new ChartServiceImplement(chartDao);
        try {
            List<Map<Object,Object>> list = chartService.monthStatByUserCount();
            String json =  gson.toJson(list);
            response.getWriter().write(json);
        } catch (Exception ex){
            ex.printStackTrace();
        }


    }
}
