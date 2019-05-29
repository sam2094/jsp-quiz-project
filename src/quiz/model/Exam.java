package quiz.model;

public class Exam {
    private long id;
    private long quizId;
    private long examerId;
    private long trueAnsweCount;
    private long falseAnswerCount;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getQuizId() {
        return quizId;
    }

    public void setQuizId(long quizId) {
        this.quizId = quizId;
    }

    public long getExamerId() {
        return examerId;
    }

    public void setExamerId(long examerId) {
        this.examerId = examerId;
    }

    public long getTrueAnsweCount() {
        return trueAnsweCount;
    }

    public void setTrueAnsweCount(long trueAnsweCount) {
        this.trueAnsweCount = trueAnsweCount;
    }

    public long getFalseAnswerCount() {
        return falseAnswerCount;
    }

    public void setFalseAnswerCount(long falseAnswerCount) {
        this.falseAnswerCount = falseAnswerCount;
    }

    @Override
    public String toString() {
        return "Exam{" +
                "id=" + id +
                ", quizId=" + quizId +
                ", examerId=" + examerId +
                ", trueAnsweCount=" + trueAnsweCount +
                ", falseAnswerCount=" + falseAnswerCount +
                '}';
    }
}
