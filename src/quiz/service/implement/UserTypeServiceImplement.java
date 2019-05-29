package quiz.service.implement;

import quiz.dao.implement.UserTypeDaoImplement;
import quiz.dao.UserTypeDao;
import quiz.model.UserType;
import quiz.service.UserTypeService;

import java.util.List;

public class UserTypeServiceImplement implements UserTypeService {
    private UserTypeDao userTypeDao ;

    public UserTypeServiceImplement(UserTypeDao userTypeDao) {
        this.userTypeDao = userTypeDao;
    }

    @Override
    public List<UserType> getTypesList() throws Exception {
        return userTypeDao.getTypesList();
    }
}
