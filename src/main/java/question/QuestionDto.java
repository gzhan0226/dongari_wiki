package question;

public class QuestionDto {
	private int id;
	private int user_id;
	private int dongari_id;
	private String title;
	private String body;
	private String answer;
	
	public QuestionDto(int id, int user_id, int dongari_id, String title, String body, String answer) {
		this.id = id;
		this.user_id = user_id;
		this.dongari_id = dongari_id;
		this.title = title;
		this.body = body;
		this.answer = answer;
	}
	
	public int getId() {
		return id;
	}
	
	public int getUser_id() {
		return user_id;
	}
	
	public int getDongari_id() {
		return dongari_id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getBody() {
		return body;
	}
	
	public String getAnswer() {
		return answer;
	}
}
