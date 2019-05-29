package quiz.service.implement;

import quiz.dao.ChartDao;
import quiz.service.ChartService;

import java.util.List;
import java.util.Map;

public class ChartServiceImplement implements ChartService {
    private ChartDao chartDao;
    public ChartServiceImplement(ChartDao chartDao){
        this.chartDao = chartDao;
    }

    @Override
    public List<Map<Object, Object>> monthStatByUserCount() throws Exception {
        return chartDao.monthStatByUserCount();
    }
}
