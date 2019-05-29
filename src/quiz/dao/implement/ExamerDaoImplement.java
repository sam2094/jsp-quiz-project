package quiz.dao.implement;

import quiz.dao.DataManager;
import quiz.dao.ExamerDao;
import quiz.model.Examer;

public class ExamerDaoImplement extends DataManager implements ExamerDao {
    @Override
    public Examer getExamerInfo(int examerId) throws Exception {
        Examer examer = new Examer();
        String sql = "SELECT * FROM user inner join examer on user.id = examer.user_id where user.id = ?;";

        try {
            connection = connect();
            if(connection != null) {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setLong(1,examerId);
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                examer.setName(resultSet.getString("user.name"));
                examer.setSurname(resultSet.getString("user.surname"));
                examer.setDescription(resultSet.getString("examer.description"));
                examer.setPhone(resultSet.getString("examer.phone"));
                examer.setBirth_date(resultSet.getDate("examer.birth_date"));
                }
            } else {
                System.out.println("Connection is null");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            disconnect();
        }


        return examer;
    }

    @Override
    public boolean changeCurrentPassword(int examerId,String currentPassword,String password) throws Exception {
        boolean result = false;
        String sql = "Update user Set password = ? where id = ? and password = ?";
        try{
            connection = connect();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1,password);
                preparedStatement.setLong(2,examerId);
                preparedStatement.setString(3,currentPassword);
                int rows = preparedStatement.executeUpdate();
                if(rows == 0) {
                    result = false;
                } else {
                    result = true;
                }
            } else {
                System.out.println("Connection is null");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            disconnect();
        }
        return result;
    }

    @Override
    public boolean updateExamer(Examer examer) throws Exception {
        boolean result = false;
        String sql = "Update examer Set description = ? , birth_date = ? , phone = ? where user_id = ? ";
        try {
            connection = connect();
            if (connection != null) {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1,examer.getDescription());
                preparedStatement.setDate(2,new java.sql.Date(examer.getBirth_date().getTime()));
                preparedStatement.setString(3,examer.getPhone());
                preparedStatement.setLong(4,examer.getUserId());
                preparedStatement.execute();
                result = true;
            } else {
                System.out.println("Connection is null");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            disconnect();
        }
        return result;
    }
}
