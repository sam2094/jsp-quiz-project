package quiz.dao;

import quiz.model.Examer;

public interface ExamerDao {
    Examer getExamerInfo(int examerId) throws Exception;
    boolean changeCurrentPassword(int examerId,String currentPassword,String password) throws Exception;
    boolean updateExamer(Examer examer) throws Exception;
}
