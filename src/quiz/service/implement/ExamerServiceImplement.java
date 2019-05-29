package quiz.service.implement;

import quiz.dao.ExamerDao;
import quiz.model.Examer;
import quiz.service.ExamerService;

public class ExamerServiceImplement implements ExamerService {
    private ExamerDao examerDao;
    public ExamerServiceImplement(ExamerDao examerDao){
        this.examerDao = examerDao;
    }

    @Override
    public Examer getExamerInfo(int examerId) throws Exception {
        return examerDao.getExamerInfo(examerId);
    }

    @Override
    public boolean changeCurrentPassword(int examerId,String currentPassword,String password) throws Exception {
        return examerDao.changeCurrentPassword(examerId,currentPassword,password);
    }

    @Override
    public boolean updateExamer(Examer examer) throws Exception {
        return examerDao.updateExamer(examer);
    }
}
