package quiz.dao.implement;

import quiz.dao.DataManager;
import quiz.dao.LoginDao;
import quiz.model.Login;
import quiz.model.User;
import quiz.model.UserType;

public class LoginDaoImplement extends DataManager implements LoginDao {

    @Override
    public User login(String username, String password) throws Exception {
        User user = new User();
        String sql = "Select username,name,role_id,id from user where username = ? and password = ?";
        try {
            connection = connect();
            if(connection != null){
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1,username);
                preparedStatement.setString(2,password);
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    user.setUsername(resultSet.getString("username"));
                    user.setId(resultSet.getLong("id"));
                    user.setName(resultSet.getString("name"));
                    UserType userType = new UserType();
                    userType.setId(resultSet.getInt("role_id"));
                    user.setUserType(userType);
                } else{
                    user = null;
                }
            } else {
                System.out.println("Connection is null");
            }

        } catch (Exception ex) {

        } finally {
            disconnect();
        }
        return user;
    }
}
