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
	
	public List<DongariDto> findAll() {
		List<DongariDto> dongariDtoList = dongariDao.findAll();
		return dongariDtoList;
	}
	
	public DongariDto findById(int id) {
		DongariDto dongariDto = dongariDao.findById(id);
		return dongariDto;
	}
}
