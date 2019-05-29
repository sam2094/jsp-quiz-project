package quiz.model;

import java.util.Date;

public class Examer extends User {
    private  long userId;
    private  String description;
    private  Date birth_date;
    private  String image;
    private  String phone;

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(Date birth_date) {
        this.birth_date = birth_date;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Examer{" +
                "userId=" + userId +
                ", description='" + description + '\'' +
                ", birth_date=" + birth_date +
                ", image='" + image + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
