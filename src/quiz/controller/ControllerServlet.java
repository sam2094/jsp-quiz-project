package quiz.controller;

import quiz.dao.QuizDao;
import quiz.dao.UserDao;
import quiz.dao.implement.QuizDaoImplement;
import quiz.model.Quiz;
import quiz.model.QuizCategory;
import quiz.model.User;
import quiz.service.QuizService;
import quiz.service.UserService;
import quiz.service.implement.QuizServiceImplement;
import quiz.util.MainUtil;

import javax.servlet.ServletException;

import quiz.dao.implement.UserDaoImplement;
import quiz.dao.implement.UserTypeDaoImplement;
import quiz.dao.UserTypeDao;
import quiz.model.UserType;
import quiz.service.implement.UserServiceImplement;
import quiz.service.implement.UserTypeServiceImplement;
import quiz.service.UserTypeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@WebServlet(name = "ControllerServlet", urlPatterns = "/cs")
public class ControllerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        if (request.getSession().getAttribute("admin") != null) {
            processRequest(request, response);
            processRequestSecond(request, response);
            System.out.println(request.getSession());
        } else {
            System.out.println(request.getContextPath());
            System.out.println("doesnt have");
            RequestDispatcher requestDispatcher = request
                    .getRequestDispatcher("/login.jsp");
            requestDispatcher.forward(request, response);
//            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        if (request.getSession().getAttribute("admin") != null) {
            processRequest(request, response);
            System.out.println(request.getSession().getAttribute("admin"));
            processRequestSecond(request, response);
        } else {
            System.out.println("doesnt have");
            System.out.println(request.getContextPath());
            RequestDispatcher requestDispatcher = request
                    .getRequestDispatcher("/login.jsp");
            requestDispatcher.forward(request, response);
//            response.sendRedirect("http://localhost:8080/"+request.getContextPath()+"/login.jsp");
        }
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = "";
        String address = null;
        UserDao userDao = new UserDaoImplement();
        UserService userService = new UserServiceImplement(userDao);
        QuizDao quizDao = new QuizDaoImplement();
        QuizService quizService = new QuizServiceImplement(quizDao);
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        try {
            if (action.equalsIgnoreCase("addUser")) {
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String password = request.getParameter("password");
                int userTypeId = Integer.parseInt(request.getParameter("userType"));
                password = MainUtil.MD5(password);
                int moderatorId = Integer.parseInt(request.getParameter("moderatorId"));
                String username = request.getParameter("username");
                User user = new User();
                UserType userType = new UserType();
                userType.setId(userTypeId);
                user.setUserType(userType);
                user.setName(firstName);
                user.setSurname(lastName);
                user.setPassword(password);
                user.setUsername(username);
                boolean result = userService.addUser(user, moderatorId);
            } else if (action.equalsIgnoreCase("checkUsername")) {
                String username = request.getParameter("username");
                boolean validation = userService.checkUsername(username);
                if (validation) {
                    response.getWriter().print("1");
                } else {
                    response.getWriter().print("0");
                }
            } else if (action.equalsIgnoreCase("getModeratorList")) {
                List<User> userList = userService.getModeratorList();
                request.setAttribute("userList", userList);
                request.getRequestDispatcher("WEB-INF/pages/moderatorsList.jsp").forward(request, response);
            } else if (action.equalsIgnoreCase("getQuizList")) {
                List<Quiz> quizList = quizService.getQuizList();
                request.setAttribute("quizList", quizList);
                request.getRequestDispatcher("WEB-INF/pages/quizList.jsp").forward(request, response);
            } else if (action.equalsIgnoreCase("deleteQuiz")) {
                int quizId = Integer.parseInt(request.getParameter("quizId"));
                boolean result = quizService.deleteQuiz(quizId);
                if (result) {
                    response.getWriter().print("success");
                } else {
                    response.getWriter().print("failed");
                }
            } else if (action.equalsIgnoreCase("restoreQuiz")) {
                int quizId = Integer.parseInt(request.getParameter("quizId"));

                boolean result = quizService.restoreQuiz(quizId);
                if (result) {
                    response.getWriter().print("success");
                } else {
                    response.getWriter().print("failed");
                }
            } else if (action.equalsIgnoreCase("updateQuiz")) {
                int quizId = Integer.parseInt(request.getParameter("quizId"));
                int quizModeratorId = Integer.parseInt(request.getParameter("quizModeratorId"));
                int quizCategoryId = Integer.parseInt(request.getParameter("quizCategoryId"));
                String quizName = request.getParameter("quizName");
                Quiz quiz = new Quiz();
                quiz.setId(quizId);
                quiz.setName(quizName);
                quiz.setModeratorId(quizModeratorId);
                QuizCategory quizCategory = new QuizCategory();
                quizCategory.setId(quizCategoryId);
                quiz.setQuizCategory(quizCategory);
                quizService.updateQuiz(quiz);
            } else if (action.equalsIgnoreCase("addQuiz")) {
                int quizModeratorId = Integer.parseInt(request.getParameter("quizModeratorId"));
                int quizCategoryId = Integer.parseInt(request.getParameter("quizCategoryId"));
                String quizName = request.getParameter("quizName");
                Quiz quiz = new Quiz();
                quiz.setName(quizName);
                quiz.setModeratorId(quizModeratorId);
                QuizCategory quizCategory = new QuizCategory();
                quizCategory.setId(quizCategoryId);
                quiz.setQuizCategory(quizCategory);
                quizService.addQuiz(quiz);
            } else if (action.equalsIgnoreCase("testQuiz")) {

                String[] quizList = request.getParameterValues("quizList[]");
                System.out.println("+ " + quizList[0]);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void processRequestSecond(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = null;
        String address = null;
        UserDao userDao = new UserDaoImplement();
        UserService userService = new UserServiceImplement(userDao);
        UserTypeDao userTypeDao = new UserTypeDaoImplement();
        UserTypeService userTypeService = new UserTypeServiceImplement(userTypeDao);
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        try {
            if (action.equalsIgnoreCase("getUserList")) {
                List<User> userList = userService.getUserList();
                request.setAttribute("userList", userList);
                address = "WEB-INF/pages/userTable.jsp";
            } else if (action.equalsIgnoreCase("deleteUser")) {
                User user = new User();
                long userId = Long.parseLong(request.getParameter("userId"));
                user.setId(userId);
                if (user.getId() > 0) {
                    userService.removeOrRestoreUser(user, "remove");
                } else {
                    System.out.println("User not found");
                }
            } else if (action.equalsIgnoreCase("restoreUser")) {
                User user = new User();
                long userId = Long.parseLong(request.getParameter("userId"));
                user.setId(userId);
                if (user.getId() > 0) {
                    userService.removeOrRestoreUser(user, "restore");
                } else {
                    System.out.println("User not found");
                }
            } else if (action.equalsIgnoreCase("getTypesList")) {
                UserType userType = new UserType();
                List<UserType> userTypesList = userTypeService.getTypesList();
                request.setAttribute("userTypesList", userTypesList);
                address = "WEB-INF/pages/userTypes.jsp";
            } else if (action.equalsIgnoreCase("updateUser")) {
                long userId = Long.parseLong(request.getParameter("userId"));
                long userTypeId = Long.parseLong(request.getParameter("userTypeId"));
                String userName = request.getParameter("userName");
                String userSurname = request.getParameter("userSurname");
                String userUsername = request.getParameter("userUsername");
                UserType userType = new UserType();
                userType.setId(userTypeId);
                User user = new User();
                user.setId(userId);
                user.setName(userName);
                user.setSurname(userSurname);
                user.setUsername(userUsername);
                user.setUserType(userType);
                System.out.println(user);
                userService.updateUser(user);

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        if (address != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.forward(request, response);
        }
    }
}





