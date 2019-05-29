package quiz.dao;

import quiz.model.UserType;

import java.util.List;

public interface UserTypeDao {
    List<UserType> getTypesList() throws  Exception;
}
