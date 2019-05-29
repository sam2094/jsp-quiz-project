package quiz.service.implement;

import quiz.dao.UserDao;
import quiz.model.User;
import quiz.service.UserService;
import java.util.List;

public class UserServiceImplement implements UserService {
    private UserDao userDao;

    public UserServiceImplement(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public List<User> getUserList() throws Exception {
        return userDao.getUserList();
    }

    @Override
    public boolean removeOrRestoreUser(User user,String action) throws Exception {
        return userDao.removeOrRestoreUser(user,action);
    }

    @Override
    public void updateUser(User user) throws Exception {
        userDao.updateUser(user);
    }
    @Override
    public boolean addUser(User user,int moderatorId) throws Exception {
        return userDao.addUser(user,moderatorId);
    }

    @Override
    public boolean checkUsername(String username) throws Exception {
        return userDao.checkUsername(username);
    }

    @Override
    public List<User> getModeratorList() throws Exception {
        return userDao.getModeratorList();
    }

}
