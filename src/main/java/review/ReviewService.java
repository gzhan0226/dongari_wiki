package review;

import java.util.List;

public class ReviewService {
	private ReviewDao reviewDao;
	
	public ReviewService() {
		reviewDao = new ReviewDao();
	}
	
	public void saveReview(ReviewDto reviewDto) {
		reviewDao.save(reviewDto);
	}
	
	public List<ReviewDto> findAllByDongariId(int dongari_id) {
		List<ReviewDto> reviewDtoList = reviewDao.findAllByDongariId(dongari_id); 
		return reviewDtoList;
	}
}
