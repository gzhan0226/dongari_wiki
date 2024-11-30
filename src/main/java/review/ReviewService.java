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
	
	public void editReview(ReviewDto reviewDto) {
		reviewDao.edit(reviewDto);
	}
	
	public void deleteReview(int id) {
		reviewDao.deleteById(id);
	}
	
	public List<ReviewDto> findAllByDongariId(int dongari_id) {
		List<ReviewDto> reviewDtoList = reviewDao.findAllByDongariId(dongari_id); 
		return reviewDtoList;
	}
	
	public List<ReviewDto> findAllByUserId(int user_id) {
		List<ReviewDto> reviewDtoList = reviewDao.findAllByUserId(user_id); 
		return reviewDtoList;
	}
	
	public ReviewDto findById(int id) {
		ReviewDto reviewDto = reviewDao.findById(id); 
		return reviewDto;
	}
	
	public double getAverageAtm(List<ReviewDto> reviewDtoList ) {
		int totalAtm = reviewDtoList.stream()
                .mapToInt(ReviewDto::getAtm) // ReviewDto의 atm 필드 값 추출
                .sum();
		
		return (double) totalAtm / reviewDtoList.size();
	}
	public double getAverageAct(List<ReviewDto> reviewDtoList ) {
		int totalAct = reviewDtoList.stream()
                .mapToInt(ReviewDto::getAct) 
                .sum();
		
		return (double) totalAct / reviewDtoList.size();
	}
	public double getAverageMan(List<ReviewDto> reviewDtoList ) {
		int totalMan = reviewDtoList.stream()
                .mapToInt(ReviewDto::getMan) 
                .sum();
		
		return (double) totalMan / reviewDtoList.size();
	}
}
