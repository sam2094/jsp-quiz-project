package quiz.service;
import java.util.List;
import java.util.Map;
public interface ChartService {
    List<Map<Object,Object>> monthStatByUserCount() throws Exception;
}
