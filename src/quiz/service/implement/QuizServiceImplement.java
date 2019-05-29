package quiz.service.implement;

import quiz.dao.QuizDao;
import quiz.model.Answer;
import quiz.model.ExamerAnswerStat;
import quiz.model.Question;
import quiz.model.Quiz;
import quiz.service.QuizService;
import java.util.List;

public class QuizServiceImplement implements QuizService {
    private QuizDao quizDao;
    public QuizServiceImplement(QuizDao quizDao){
        this.quizDao = quizDao;
    }
    @Override
    public List<Quiz> getQuizList() throws Exception {
        return quizDao.getQuizList();
    }

    @Override
    public boolean deleteQuiz(int quizId) throws Exception {
        return quizDao.deleteQuiz(quizId);
    }

    @Override
    public boolean restoreQuiz(int quizId) throws Exception {
        return quizDao.restoreQuiz(quizId);
    }

    @Override
    public boolean updateQuiz(Quiz quiz) throws Exception {
        return quizDao.updateQuiz(quiz);
    }

    @Override
    public boolean addQuiz(Quiz quiz) throws Exception {
        return quizDao.addQuiz(quiz);
    }

    @Override
    public boolean addQuestionForQuiz(Question question) throws Exception {
        return quizDao.addQuestionForQuiz(question);
    }

    @Override
    public List<Question> getQuestionListByQuiz(int quizId) throws Exception {
        return quizDao.getQuestionListByQuiz(quizId);
    }

    @Override
    public List<Question> getQuizForStudent(Long userId) throws Exception {
        return quizDao.getQuizForStudent(userId);
    }

    @Override
    public boolean submitQuiz(ExamerAnswerStat examerAnswerStat) throws Exception {
        return quizDao.submitQuiz(examerAnswerStat);
    }

    @Override
    public boolean checkingQuiz(int examerId,double examTime) throws Exception {
        return quizDao.checkingQuiz(examerId,examTime);
    }
}
