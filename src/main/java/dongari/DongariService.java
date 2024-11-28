package dongari;

import java.util.List;

public class DongariService {
	private DongariDao dongariDao;
	
	public DongariService() {
		dongariDao = new DongariDao();
	}
	
	public void saveDongari(DongariDto dongariDto) {
		dongariDao.save(dongariDto);
	}
	
	public void editDongari(DongariDto dongariDto) {
		dongariDao.edit(dongariDto);
	}
	
	public List<DongariDto> findAll() {
		List<DongariDto> dongariDtoList = dongariDao.findAll();
		return dongariDtoList;
	}
	
	public DongariDto findById(int id) {
		DongariDto dongariDto = dongariDao.findById(id);
		return dongariDto;
	}
	
	public void deleteDongari(int id) {
		dongariDao.DeleteById(id);
	}
	
	public List<DongariDto> findByUserId(int user_id) {
		List<DongariDto> dongariDtoList = dongariDao.findByUserId(user_id);
		return dongariDtoList;
	}
}
