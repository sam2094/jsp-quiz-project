package quiz.dao;

import java.util.List;
import java.util.Map;

public interface ChartDao {
    List<Map<Object,Object>> monthStatByUserCount() throws Exception;
}
