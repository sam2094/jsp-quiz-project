package quiz.dao.implement;

import quiz.dao.DataManager;
import quiz.dao.QuizDao;
import quiz.model.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuizDaoImplement extends DataManager implements QuizDao {
    @Override
    public List<Quiz> getQuizList() throws Exception {
        List<Quiz> quizList = new ArrayList<>();
        String sql = "SELECT * ,CASE WHEN quiz.status = 1 THEN 'Active' ELSE 'Deleted' END AS stat FROM quiz.quiz inner join quiz_category on quiz.category_id = quiz_category.id inner join user on quiz.moder_id = user.id;";
        try{
            connection = connect();
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Quiz quiz = new Quiz();
                quiz.setId(resultSet.getInt("quiz.id"));
                quiz.setName(resultSet.getString("quiz.name"));
                quiz.setStatus(resultSet.getString("stat"));
                QuizCategory  quizCategory = new QuizCategory();
                quizCategory.setId(resultSet.getInt("quiz_category.id"));
                quizCategory.setName(resultSet.getString("quiz_category.name"));
                quiz.setQuizCategory(quizCategory);
                quiz.setModeratorId(resultSet.getInt("user.id"));
                quiz.setModeratorName(resultSet.getString("user.name"));
                quizList.add(quiz);
            }
        } catch (Exception ex){
            ex.printStackTrace();
        } finally {
            disconnect();
        }
        return quizList;
    }

    @Override
    public boolean deleteQuiz(int quizId) throws Exception {
        String sql = "Update quiz set status = 0 where id = ?";
        boolean result = false;
        try{
            connection = connect();
            if(connection != null){
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1,quizId);
                preparedStatement.execute();
                result = true;
            } else {
                System.out.println("Connection is null");
            }
        }catch (Exception ex){
            ex.printStackTrace();
        } finally {
            disconnect();
        }
        return result;
    }

    @Override
    public boolean restoreQuiz(int quizId) throws Exception {
        String sql = "Update quiz set status = 1 where id = ?";
        boolean result = false;
        try{
            connection = connect();
            if(connection != null){
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1,quizId);
                preparedStatement.execute();
                result = true;
            } else {
                System.out.println("Connection is empty");
            }
        }catch (Exception ex){
            ex.printStackTrace();
        } finally {
            disconnect();
        }
        return result;
    }

    @Override
    public boolean updateQuiz(Quiz quiz) throws Exception {
        boolean result = false;
        String sql = "Update quiz set name = ? , category_id = ? , moder_id = ? where id = ?";
        try {
            connection = connect();
            if(connection != null) {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1,quiz.getName());
                preparedStatement.setLong(2,quiz.getQuizCategory().getId());
                preparedStatement.setLong(3,quiz.getModeratorId());
                preparedStatement.setLong(4,quiz.getId());
                preparedStatement.execute();
                result = true;
            } else {
                System.out.println("Connection is null");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            disconnect();
        }

        return result;
    }

    @Override
    public boolean addQuiz(Quiz quiz) throws Exception {
        boolean result = false;
        String sql = "Insert into quiz(name,category_id,moder_id) values(?,?,?)";
        try {
            connection = connect();
            if(connection != null) {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1,quiz.getName());
                preparedStatement.setLong(2,quiz.getQuizCategory().getId());
                preparedStatement.setLong(3,quiz.getModeratorId());
                preparedStatement.execute();
                result = true;
            } else {
                System.out.println("Connection is null");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            disconnect();
        }

        return result;
    }

    @Override
    public boolean addQuestionForQuiz(Question question) throws Exception {
        boolean result = true;
        String sql = "Insert into question(content,image,quiz_id) Values(?,?,?)";
        String sql2 = "Insert into answer(question_id,content,true_answer) Values(?,?,?)";
        try {
            connection = connect();
            if (connection != null) {
                System.out.println("connection is good");
                preparedStatement = connection.prepareStatement(sql,preparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1,question.getContent());
                preparedStatement.setString(2,question.getImage());
                preparedStatement.setLong(3,question.getQuiz().getId());
                preparedStatement.execute();
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        long questionId = generatedKeys.getLong(1);
                        for(int i = 0;i<question.getAnswerList().size();i++){
                            preparedStatement = connection.prepareStatement(sql2);
                            preparedStatement.setLong(1,questionId);
                            preparedStatement.setString(2, question.getAnswerList().get(i).getContent());
                            preparedStatement.setInt(3,question.getAnswerList().get(i).getTrueAnswer());
                            preparedStatement.execute();
                        }
                        result = true;
                    } else {
                        result = false;
                        throw new SQLException("Creating user failed, no ID obtained.");
                    }

                }
            } else {
                System.out.println("connection is null");
            }

        } catch (Exception ex){
            ex.printStackTrace();
        } finally {
            disconnect();
        }
        return result;
    }

    @Override
    public List<Question> getQuestionListByQuiz(int quizId) throws Exception {
        String sql = "SELECT * FROM quiz.answer INNER JOIN quiz.question on answer.question_id = question.id INNER JOIN quiz on question.quiz_id = quiz.id where question.quiz_id = ? order by question_id;";
        List<Question> questionList = new ArrayList<>();
        try{
            connection = connect();
            if(connection != null ){

                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1,quizId);
                resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    Answer answer = new Answer();
                    answer.setContent(resultSet.getString("answer.content"));
                    answer.setTrueAnswer(resultSet.getInt("answer.true_answer"));
                    answer.setId(resultSet.getInt("answer.id"));
                    Question question = new Question();
                    question.setContent(resultSet.getString("question.content"));
                    question.setId(resultSet.getInt("question.id"));
                    Quiz quiz = new Quiz();
                    quiz.setId(resultSet.getInt("quiz.id"));
                    quiz.setName(resultSet.getString("quiz.name"));
                    question.setQuiz(quiz);
                    question.setAnswer(answer);
                    questionList.add(question);
                }


            } else {
                System.out.println("Connection is null");

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            disconnect();
        }


        return questionList;
    }

    @Override
    public List<Question> getQuizForStudent(Long userId) throws Exception {
        String sql = "SELECT * FROM answer inner join question on question_id = question.id inner join quiz on question.quiz_id = quiz.id inner join moder_to_examer on quiz.moder_id = moder_to_examer.moder_id inner join quiz_category on quiz.category_id=quiz_category.id where moder_to_examer.examer_id = ? and quiz.status = 1 and quiz.id not in (select quiz_id from exam where exam.examer_id = ?) order by answer.question_id";
        List<Question> questionList = new ArrayList<>();

        try{
            connection = connect();
            if(connection!=null) {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setLong(1,userId);
                preparedStatement.setLong(2,userId);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    Answer answer = new Answer();
                    answer.setContent(resultSet.getString("answer.content"));
                    answer.setTrueAnswer(resultSet.getInt("answer.true_answer"));
                    answer.setId(resultSet.getInt("answer.id"));
                    Question question = new Question();
                    question.setContent(resultSet.getString("question.content"));
                    question.setId(resultSet.getInt("question.id"));
                    Quiz quiz = new Quiz();
                    quiz.setId(resultSet.getInt("quiz.id"));
                    quiz.setName(resultSet.getString("quiz.name"));
                    QuizCategory quizCategory = new QuizCategory();
                    quizCategory.setName(resultSet.getString("quiz_category.name"));
                    quiz.setQuizCategory(quizCategory);
                    question.setQuiz(quiz);
                    question.setAnswer(answer);
                    questionList.add(question);
                }
            }else {
                System.out.println("Connection is null");
            }
        } catch (Exception ex){
            ex.printStackTrace();
        } finally {
            disconnect();
        }

        return questionList;
    }

    @Override
    public boolean submitQuiz(ExamerAnswerStat examerAnswerStat) throws Exception {
        boolean result = false;
        String sql = "Insert into examer_answer_stat(examer_id,question_id,answer_id) VALUES(?,?,?)";
        for(Question question : examerAnswerStat.getQuestionList()) {
            for(Answer answer : question.getAnswerList()) {
                try {
                    connection = connect();
                    if (connection != null) {
                        preparedStatement = connection.prepareStatement(sql);
                        preparedStatement.setLong(1, examerAnswerStat.getExamerId());
                        preparedStatement.setLong(2, question.getId());
                        preparedStatement.setLong(3,answer.getId());
                        preparedStatement.execute();
                        result = true;
                    } else {
                        System.out.println("Connection is null");
                        result = false;
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                } finally {

                    disconnect();
                }
            }
        }        return result;
    }

    @Override
    public boolean checkingQuiz(int examerId,double examTime) throws Exception {
        boolean result = false;
        String sql = "Insert into exam(quiz_id,examer_id,true_answer_count,false_answer_count,time) " +
                "values((Select distinct question.quiz_id from question inner join examer_answer_stat on examer_answer_stat.question_id=question.id where examer_answer_stat.examer_id = ? and question.quiz_id not in (select q.quiz_id from ( select quiz_id,examer_id from exam) q where q.examer_id = ?)), " +
        "  ? , (SELECT count(answer.id) as answer_count FROM quiz.examer_answer_stat inner join answer on answer.id = examer_answer_stat.answer_id where examer_answer_stat.examer_id = ? and answer.true_answer = 1), " +
                "(SELECT count(answer.id) as answer_count FROM quiz.examer_answer_stat inner join answer on answer.id = examer_answer_stat.answer_id where examer_answer_stat.examer_id = ? and answer.true_answer = 0),?) ";
        try{
            connection = connect();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setLong(1,examerId);
                preparedStatement.setLong(2,examerId);
                preparedStatement.setLong(3,examerId);
                preparedStatement.setLong(4,examerId);
                preparedStatement.setLong(5,examerId);
                preparedStatement.setDouble(6,examTime);
                preparedStatement.execute();
                result = true;
            } else {
                System.out.println("Connection is null");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            disconnect();
        }
        return result;
    }
}
