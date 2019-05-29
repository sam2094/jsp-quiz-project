package quiz.service.implement;

import quiz.dao.LoginDao;
import quiz.model.Login;
import quiz.model.User;
import quiz.service.LoginService;

public class LoginServiceImplement implements LoginService {
    private LoginDao loginDao;
    public LoginServiceImplement(LoginDao loginDao){
        this.loginDao = loginDao;
    }
    @Override
    public User login(String username, String password) throws Exception {
        return loginDao.login(username,password);
    }
}
