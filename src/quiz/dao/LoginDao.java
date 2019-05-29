package quiz.dao;

import quiz.model.Login;
import quiz.model.User;

public interface LoginDao {
    User login(String username, String password) throws Exception;
}
