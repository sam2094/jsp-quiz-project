package quiz.dao;

import quiz.model.User;

import java.util.List;

public interface UserDao {
    boolean addUser(User user,int moderatorId) throws Exception;
    boolean checkUsername(String username) throws Exception;
    List<User> getModeratorList() throws Exception;
    List<User> getUserList() throws Exception;
    boolean removeOrRestoreUser(User user, String action) throws Exception;
    void updateUser(User user) throws Exception;
}
