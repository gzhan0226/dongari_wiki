package question;

import java.util.List;

public class QuestionService {
	
	private QuestionDao questionDao;
	
	public QuestionService() {
		questionDao = new QuestionDao();
	}
	
	public void saveQuestion(QuestionDto questionDto) {
		questionDao.save(questionDto);
	}
	
	public List<QuestionDto> findAllByDongariId(int dongari_id) {
		return questionDao.findAllByDongariId(dongari_id);
	}
	
	public List<QuestionDto> findAllByUserId(int user_id) {
		return questionDao.findAllByUserId(user_id);
	}
	
	public QuestionDto findById(int id) {
		return questionDao.findById(id);
	}
	
	public void reply(QuestionDto questionDto) {
		questionDao.edit(questionDto);
	}
	
}
