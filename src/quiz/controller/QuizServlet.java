package quiz.controller;

import quiz.dao.QuizDao;
import quiz.dao.implement.QuizDaoImplement;
import quiz.model.*;
import quiz.service.QuizService;
import quiz.service.implement.QuizServiceImplement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "QuizServlet", urlPatterns = "/qz")
public class QuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = "";
        String address = null;
        QuizDao quizDao = new QuizDaoImplement();
        QuizService quizService = new QuizServiceImplement(quizDao);
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        try {
            if(action.equalsIgnoreCase("getQuizSelectList")){
                List<Quiz> quizList = quizService.getQuizList();
                request.setAttribute("quizSelectList",quizList);
                request.getRequestDispatcher("WEB-INF/pages/quizSelectList.jsp").forward(request,response);
            } else if (action.equalsIgnoreCase("addQuestionForQuiz")){
                String questionContent = request.getParameter("question");
                String imagePath = request.getParameter("imagePath");
                int quizId = Integer.parseInt(request.getParameter("quizId"));
                Question question = new Question();
                question.setContent(questionContent);
                question.setImage(imagePath);
                Quiz quiz = new Quiz();
                quiz.setId(quizId);
                question.setQuiz(quiz);
                String[] answerContent = request.getParameterValues("answerList[]");
                String[] trueAnswer = request.getParameterValues("trueAnswer[]");
                List<Answer> answerList = new ArrayList<Answer>();
                for(int i=0;i<answerContent.length;i++){
                    Answer answer = new Answer();
                    answer.setContent(answerContent[i]);
                    answer.setTrueAnswer(Integer.parseInt(trueAnswer[i]));
                    answerList.add(answer);
                }
                question.setAnswerList(answerList);
                boolean result = quizService.addQuestionForQuiz(question);
                if(result) {
                    System.out.println("added");
                } else {
                    System.out.println("not added");
                }
            } else if(action.equalsIgnoreCase("getQuestionListByQuiz")){
                int quizId = Integer.parseInt(request.getParameter("quizId"));
                System.out.println("quizId" + quizId);
                List<Question> questionList = quizService.getQuestionListByQuiz(quizId);
                List<Question> qL = new ArrayList<>();
                for(int i=0;i<questionList.size();i++){
                    List<Answer> answerList = new ArrayList<>();
                    int k = i;
                    boolean result = false;
                    while(result == false){
                        if(questionList.get(i).getId() == questionList.get(k).getId()){
                            answerList.add(questionList.get(i).getAnswer());
                            if(i == questionList.size()-1){
                                result = true;
                                i = i-1;
                            }
                            i++;
                        }
                        else { result = true; i = i-1; }

                    }
                    Question question = new Question();
                    question.setId(questionList.get(k).getId());
                    question.setContent(questionList.get(k).getContent());
                    Quiz quiz = new Quiz();
                    quiz.setName(questionList.get(k).getQuiz().getName());
                    question.setQuiz(quiz);
                    question.setAnswerList(answerList);
                    qL.add(question);


                }
                request.setAttribute("questionList",qL);
                address = "WEB-INF/pages/questionList.jsp";
            } else if(action.equalsIgnoreCase("getQuizById")){
                Long userId = Long.parseLong(request.getParameter("userId"));
                List<Question> questionList = quizService.getQuizForStudent(userId);
                if(questionList.size()>0){
                List<Question> questionsForStudent = new ArrayList<>();
                for(int i=0;i<questionList.size();i++){
                    List<Answer> answerList = new ArrayList<>();
                    int k = i;
                    boolean result = false;
                    while(result == false){
                        if(questionList.get(i).getId() == questionList.get(k).getId()){
                            answerList.add(questionList.get(i).getAnswer());
                            if(i == questionList.size()-1){
                                result = true;
                                i = i-1;
                            }
                            i++;
                        }
                        else {
                            result = true;
                            i--; }
                    }
                    Question question = new Question();
                    question.setId(questionList.get(k).getId());
                    question.setContent(questionList.get(k).getContent());
                    Quiz quiz = new Quiz();
                    quiz.setName(questionList.get(k).getQuiz().getName());
                    QuizCategory quizCategory = new QuizCategory();
                    quizCategory.setName(questionList.get(k).getQuiz().getQuizCategory().getName());
                    quiz.setQuizCategory(quizCategory);
                    question.setQuiz(quiz);
                    question.setAnswerList(answerList);
                    questionsForStudent.add(question);
                }
                HttpSession session = request.getSession(true);
                session.setAttribute("questionList", questionsForStudent);
                session.setMaxInactiveInterval(60*60);
//                address = "WEB-INF/pages/questions-for-student.jsp";
                        response.getWriter().print("success");
                } else {
                    response.getWriter().print("error");
                }

            } else if(action.equalsIgnoreCase("getQuestionById")){
                int questionId = Integer.parseInt(request.getParameter("questionId"));
                request.setAttribute("questionId",questionId);
                address = "WEB-INF/pages/questions-for-student.jsp";
            }
            else if(action.equalsIgnoreCase("submitQuizByStudent")){
                String[] answerList = request.getParameterValues("quiz[]");
                ExamerAnswerStat examerAnswerStat = new ExamerAnswerStat();
                List<Question> questionList = new ArrayList<>();
                for (int i=0,j=1;i<answerList.length;i++,j+=2){
                    Question question = new Question();
                    question.setId(Integer.parseInt(answerList[i]));
                    String[] aL = request.getParameterValues("quiz["+ j +"][]");
                    List<Answer> answerList1 = new ArrayList<>();
                    for(int l = 0; l < aL.length;l++){
                        Answer answer = new Answer();
                        answer.setId(Integer.parseInt(aL[l]));
                        answerList1.add(answer);
                    }
                    question.setAnswerList(answerList1);
                    questionList.add(question);
                }
                examerAnswerStat.setQuestionList(questionList);
                examerAnswerStat.setExamerId(Long.parseLong(request.getParameter("examerId")));
                int examerId = Integer.parseInt(request.getParameter("examerId"));
                double examTime = Double.parseDouble(request.getParameter("timer"));
                boolean result = quizService.submitQuiz(examerAnswerStat);
                if(result){
                 quizService.checkingQuiz(examerId,examTime);
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
