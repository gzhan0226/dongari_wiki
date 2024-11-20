package scraps;

import java.util.List;

public class ScrapsService {
	private ScrapsDao scrapsDao;
	
	public ScrapsService() {
		scrapsDao = new ScrapsDao();
	}
	
	public void doScraps(int dongari_id, int user_id) {
		scrapsDao.save(dongari_id, user_id);
	}
	
	public void deleteScraps(int dongari_id, int user_id) {
		scrapsDao.delete(dongari_id, user_id);
	}
	
	public boolean check(int dongari_id, int user_id) {
		if (scrapsDao.find(dongari_id, user_id) != null) {
			return true;
		}
		else
			return false;
	}
	
	public List<ScrapsDto> findAll(int user_id) {
		return scrapsDao.findAllByUserId(user_id);
	}
}
