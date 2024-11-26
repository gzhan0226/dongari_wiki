package likes;

public class LikesService {
	private LikesDao likesDao;
	
	public LikesService() {
		likesDao = new LikesDao();
	}
	
	public void likeReview(int review_id, int user_id) {
		likesDao.save(review_id, user_id);
	}
	
	public void cancelReview(int review_id, int user_id) {
		likesDao.delete(review_id, user_id);
	}
	
	public boolean check(int review_id, int user_id) {
		if (likesDao.find(review_id, user_id) != null) {
			return true;
		}
		else
			return false;
	}
	
	public int count(int review_id) {
		return likesDao.count(review_id);
	}
}
