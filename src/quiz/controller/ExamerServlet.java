package quiz.controller;

import quiz.dao.ExamerDao;
import quiz.dao.QuizDao;
import quiz.dao.implement.ExamerDaoImplement;
import quiz.dao.implement.QuizDaoImplement;
import quiz.model.*;
import quiz.service.ExamerService;
import quiz.service.QuizService;
import quiz.service.implement.ExamerServiceImplement;
import quiz.service.implement.QuizServiceImplement;
import quiz.util.MainUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ExamerServlet",urlPatterns = "/es")
public class ExamerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        if (request.getSession().getAttribute("user") != null) {
            processRequest(request, response);
        } else {

            RequestDispatcher requestDispatcher = request
                    .getRequestDispatcher("/login.jsp");
            requestDispatcher.forward(request, response);
//            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            processRequest(request, response);
        } else {

            RequestDispatcher requestDispatcher = request
                    .getRequestDispatcher("/login.jsp");
            requestDispatcher.forward(request, response);
//            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = "";
        String address = null;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        QuizDao quizDao = new QuizDaoImplement();
        QuizService quizService = new QuizServiceImplement(quizDao);
        ExamerDao examerDao = new ExamerDaoImplement();
        ExamerService examerService = new ExamerServiceImplement(examerDao);
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        try {
            if(action.equalsIgnoreCase("editExamer")) {
            int examerId = Integer.parseInt(request.getParameter("examerId"));
            Examer examer = examerService.getExamerInfo(examerId);
            request.setAttribute("examer",examer);
            address = "WEB-INF/pages/examer/examerInfo.jsp";
            }
            else if (action.equalsIgnoreCase("changePassword")) {
                String password = request.getParameter("password");
                String confirmPassword = request.getParameter("confirmPassword");
                String currentPassword = request.getParameter("currentPassword");
                int examerId = Integer.parseInt(request.getParameter("examerId"));
                boolean samePassword = false;
                if(password.trim().equals(confirmPassword.trim())) {
                    samePassword = true;
                }
                if (samePassword) {
                    currentPassword = MainUtil.MD5(currentPassword.trim());
                    password = MainUtil.MD5(password.trim());
                    boolean truePassword = examerService.changeCurrentPassword(examerId,currentPassword,password);
                    if(truePassword) {
                        response.getWriter().print("success");
                    } else {
                        response.getWriter().print("error");
                    }
                } else {
                    response.getWriter().print("different");
                }

            } else if (action.equalsIgnoreCase("updateExamer")) {
                String phone = request.getParameter("phoneNumber");
                String birthdate = request.getParameter("birthdate");
                int examerId = Integer.parseInt(request.getParameter("examerId"));
                String description = request.getParameter("description");
                Examer examer = new Examer();
                examer.setUserId(examerId);
                if(!birthdate.equals("")){
                examer.setBirth_date(dateFormat.parse(birthdate));}
                examer.setPhone(phone);
                examer.setDescription(description);
                boolean result = examerService.updateExamer(examer);
                if (result) {
                    response.getWriter().print("success");
                } else {
                    response.getWriter().print("failed");
                }

            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }
        if (address != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
        }
    }
}
