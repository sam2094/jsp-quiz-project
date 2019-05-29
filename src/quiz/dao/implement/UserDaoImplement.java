package quiz.dao.implement;

import quiz.dao.DataManager;
import quiz.dao.UserDao;
import quiz.model.User;
import quiz.model.UserType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImplement extends DataManager implements UserDao {
    @Override
    public List<User> getUserList() throws Exception {
        List<User> userList = new ArrayList<>();
        String query = "select *, case when user.status = 1 then 'Active' else 'Deleted' end as st from user left join user_type on user.role_id = user_type.id";
        try {
            connection = connect();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    UserType userType = new UserType();
                    userType.setId(resultSet.getLong("user_type.id"));
                    userType.setName(resultSet.getString("user_type.name"));
                    User user = new User();
                    user.setId(resultSet.getLong("user.id"));
                    user.setName(resultSet.getString("user.name"));
                    user.setSurname(resultSet.getString("user.surname"));
                    user.setPassword(resultSet.getString("user.password"));
                    user.setUsername(resultSet.getString("user.username"));
                    user.setRegisterDate(resultSet.getDate("user.register_date"));
                    user.setStatus(resultSet.getString("st"));
                    user.setUserType(userType);
                    userList.add(user);
                }

            }else{
                System.out.println("Connection is null");
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
        return userList;
    }

    @Override
    public boolean removeOrRestoreUser(User user,String action) throws Exception {
        boolean result = false;
        String query = null;
        if(action.equalsIgnoreCase("remove")){
            query = "update user set status = 0 where id = ?";
        }else if(action.equalsIgnoreCase("restore")){
            query = "update user set status = 1 where id = ?";
        }
        try {
            connection = connect();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setLong(1,user.getId());
                preparedStatement.execute();
                result = true;

            }else{
                result = false;
                System.out.println("Connection is null");
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
        return result;
    }

    @Override
    public void updateUser(User user) throws Exception {
       String query = "update user set "
               + "name = ? ,"
               + "surname = ? ,"
               + "username = ? ,"
               + "role_id = ? "
               + "where id  = ?";
         try{
             connection = connect();
             if (connection!=null){
                 preparedStatement = connection.prepareStatement(query);
                 preparedStatement.setString(1,user.getName());
                 preparedStatement.setString(2,user.getSurname());
                 preparedStatement.setString(3,user.getUsername());
                 preparedStatement.setLong(4,user.getUserType().getId());
                 preparedStatement.setLong(5,user.getId());
                 preparedStatement.execute();
             }else{
                 System.out.println("Connection null");
             }
         }catch (Exception ex){
             ex.printStackTrace();
         }finally {
             try {
                 disconnect();
             } catch (Exception ex) {
                 ex.printStackTrace();
             }
         }
    }
    @Override
    public boolean addUser(User user,int moderatorId) throws Exception {
        String sql = "Insert into user( name,surname,password,username,role_id,register_date) VALUES(?,?,?,?,?,NOW())";
        String sql2 = "Insert into moder_to_examer( moder_id,examer_id) VALUES(?,?)";
        String sql3 = "Insert into examer(user_id) VALUES(?)";
        boolean result = false;
        try {
            connection = connect();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(sql, preparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, user.getName());
                preparedStatement.setString(2, user.getSurname());
                preparedStatement.setString(3, user.getPassword());
                preparedStatement.setString(4, user.getUsername());
                preparedStatement.setLong(5,user.getUserType().getId());
                preparedStatement.execute();
                result = true;
            } else {
                System.out.println("Connection is null!");
            }
            if(moderatorId !=0) {
                try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        long examerId = generatedKeys.getLong(1);
                        preparedStatement = connection.prepareStatement(sql2);
                        preparedStatement.setInt(1, moderatorId);
                        preparedStatement.setLong(2, examerId);
                        preparedStatement.execute();
                        result = true;
                        if (result == true) {
                            preparedStatement = connection.prepareStatement(sql3);
                            preparedStatement.setLong(1,examerId);
                            preparedStatement.execute();
                            result = true;
                        }
                    } else {
                        result = false;
                        throw new SQLException("Creating user failed, no ID obtained.");
                    }

                }
            }
        }catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            disconnect();
        }
        return result;

    }

    @Override
    public boolean checkUsername(String username) throws Exception {
        boolean result = false;
        String sql = "Select username from user where username = ? ";
        try{
            connection = connect();
            if(connection != null){
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1,username);
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    result = true;
                }
            } else {
                System.out.println("Connection is null");
            }
        } catch (Exception ex){

        } finally {
            disconnect();
        }
        return result;
    }

    @Override
    public List<User> getModeratorList() throws Exception {
        List<User> moderatorList = new ArrayList<>();
        String sql = "Select id,name,surname from user where role_id = 2";
        try{
            connection = connect();
            if(connection != null) {
                preparedStatement = connection.prepareStatement(sql);
                resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    User user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setName(resultSet.getString("name"));
                    user.setSurname(resultSet.getString("surname"));
                    moderatorList.add(user);

                }
            } else {
                System.out.println("Connection is null");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            disconnect();
        }
        return moderatorList;
    }

}
