package quiz.controller;

import quiz.dao.LoginDao;
import quiz.dao.UserDao;
import quiz.dao.implement.LoginDaoImplement;
import quiz.dao.implement.UserDaoImplement;
import quiz.model.Login;
import quiz.model.User;
import quiz.service.LoginService;
import quiz.service.UserService;
import quiz.service.implement.LoginServiceImplement;
import quiz.service.implement.UserServiceImplement;
import quiz.util.MainUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet",urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginDao loginDao = new LoginDaoImplement();
        LoginService loginService = new LoginServiceImplement(loginDao);
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            password = MainUtil.MD5(password);
            if(!username.isEmpty() && username != null && !password.isEmpty() && password !=null){
                User user = loginService.login(username,password);
                if(user != null){
                    if (user.getUserType().getId() == 1){
                    HttpSession session = request.getSession(true);
                    session.setAttribute("admin", user);
//                    request.getRequestDispatcher("admin-panel/index.jsp").forward(request,response);
                        response.sendRedirect("/quiz/admin-panel/");
                    } else if(user.getUserType().getId() == 3){
                        HttpSession session = request.getSession(true);
                        session.setAttribute("user", user);
//                        request.getRequestDispatcher("index.jsp").forward(request,response);
                        response.sendRedirect("/quiz/index");
                    }
                } else{
                    request.setAttribute("invalid","Email or password is not correct");
                    request.getRequestDispatcher("login.jsp").forward(request,response);
                }

            } else {
                request.setAttribute("invalid","Email or password is empty");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }

}
