package quiz.dao.implement;

import quiz.dao.ChartDao;
import quiz.dao.DataManager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ChartDaoImplement extends DataManager implements ChartDao {
    @Override
    public List<Map<Object, Object>> monthStatByUserCount() throws Exception {
        List<Map<Object,Object>> statList = new ArrayList();
        Map<Object,Object> map = null;
        String sql = "SELECT count(id) as count,monthname(user.register_date) as month FROM user where year(user.register_date) = year(Now()) group by month(user.register_date);";
        try{
            connection = connect();
            if(connection != connect()) {
                preparedStatement = connection.prepareStatement(sql);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    map = new HashMap<>();
                    map.put("label",resultSet.getString("month"));
                    map.put("data",resultSet.getString("count"));
                    statList.add(map);
                }
            } else {
                System.out.println("Connection is null");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            disconnect();
        }
        return statList;
    }
}
