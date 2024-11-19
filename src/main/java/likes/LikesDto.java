package likes;

public class LikesDto {
    private int id;
    private int review_id;
    private int user_id;

    public LikesDto(int id, int review_id, int user_id) {
        this.id = id;
        this.review_id = review_id;
        this.user_id = user_id;
    }

    public int getId() {
        return id;
    }

    public int getReview_id() {
        return review_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setReview_id(int review_id) {
        this.review_id = review_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
}