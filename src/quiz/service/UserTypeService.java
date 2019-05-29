package quiz.service;

import quiz.model.UserType;

import java.util.List;

public interface UserTypeService {
    List<UserType> getTypesList() throws  Exception;
}
