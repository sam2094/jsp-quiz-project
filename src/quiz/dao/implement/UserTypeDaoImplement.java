package quiz.dao.implement;

import quiz.dao.DataManager;
import quiz.dao.UserTypeDao;
import quiz.model.UserType;

import java.util.ArrayList;
import java.util.List;

public class UserTypeDaoImplement extends DataManager implements UserTypeDao {
    @Override
    public List<UserType> getTypesList() throws Exception {
        List<UserType> types = new ArrayList<>();
        String query = "select * from user_type where status = 1";
        try {
            connection = connect();
             if (connection!=null){
                 preparedStatement = connection.prepareStatement(query);
                 resultSet = preparedStatement.executeQuery();
                 while (resultSet.next()){
                     UserType userType = new UserType();
                     userType.setId(resultSet.getLong("id"));
                     userType.setName(resultSet.getString("name"));
                     types.add(userType);
                 }
             }else{
                 System.out.println("Connection null");
             }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                disconnect();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return types;
    }
}
