package quiz.dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DataManager {

    protected Connection connection;
    protected PreparedStatement preparedStatement;
    protected ResultSet resultSet;

    public Connection connect() throws Exception {
        Context context = new InitialContext();
        DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/quiz");
        Connection connection = dataSource.getConnection();
        return connection;
    }

    public void disconnect() throws Exception {
        if (connection != null) {
            connection.close();
        }
        if (preparedStatement != null)
            preparedStatement.close();
        if (resultSet != null)
            resultSet.close();
    }

}