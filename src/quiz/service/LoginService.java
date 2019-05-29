package quiz.service;

import quiz.model.Login;
import quiz.model.User;

public interface LoginService {
    User login(String username, String password) throws Exception;
}
