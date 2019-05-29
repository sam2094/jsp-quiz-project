package quiz.model;

import java.util.ArrayList;
import java.util.List;

public class ExamerAnswerStat {
    private long id;
    private List<Question> questionList = new ArrayList<>();
    private long examerId;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List<Question> questionList) {
        this.questionList = questionList;
    }

    public long getExamerId() {
        return examerId;
    }

    public void setExamerId(long examerId) {
        this.examerId = examerId;
    }

    @Override
    public String toString() {
        return "ExamerAnswerStat{" +
                "id=" + id +
                ", questionList=" + questionList +
                ", examerId=" + examerId +
                '}';
    }
}
