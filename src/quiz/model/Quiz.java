package quiz.model;

public class Quiz {
    private long id;
    private long moderatorId;
    private String moderatorName;
    private String name;
    private QuizCategory quizCategory;
    private String status;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public QuizCategory getQuizCategory() {
        return quizCategory;
    }

    public void setQuizCategory(QuizCategory quizCategory) {
        this.quizCategory = quizCategory;
    }

    public long getModeratorId() {
        return moderatorId;
    }

    public void setModeratorId(long moderatorId) {
        this.moderatorId = moderatorId;
    }

    public String getModeratorName() {
        return moderatorName;
    }

    public void setModeratorName(String moderatorName) {
        this.moderatorName = moderatorName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Quiz{" +
                "id=" + id +
                ", moderatorId=" + moderatorId +
                ", moderatorName='" + moderatorName + '\'' +
                ", name='" + name + '\'' +
                ", quizCategory=" + quizCategory +
                '}';
    }
}
