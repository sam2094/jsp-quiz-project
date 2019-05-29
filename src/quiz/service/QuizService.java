package quiz.service;

import quiz.model.Answer;
import quiz.model.ExamerAnswerStat;
import quiz.model.Question;
import quiz.model.Quiz;

import java.util.List;

public interface QuizService {
    List<Quiz> getQuizList() throws Exception;
    boolean deleteQuiz(int quizId) throws Exception;
    boolean restoreQuiz(int quizId) throws Exception;
    boolean updateQuiz(Quiz quiz) throws Exception;
    boolean addQuiz(Quiz quiz) throws Exception;
    boolean addQuestionForQuiz(Question question) throws Exception;
    List<Question> getQuestionListByQuiz(int quizId) throws Exception;
    List<Question> getQuizForStudent(Long userId) throws Exception;
    boolean submitQuiz(ExamerAnswerStat examerAnswerStat) throws Exception;
    boolean checkingQuiz(int examerId,double examTime) throws Exception;
 }
