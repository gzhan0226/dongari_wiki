package scraps;

public class ScrapsDto {
	private int id;
	private int dongari_id;
	private int user_id;
	
	public ScrapsDto(int id, int dongari_id, int user_id) {
		this.id = id;
		this.dongari_id = dongari_id;
		this.user_id = user_id;
	}
	
	public int getId() {
		return id;
	}
	
	public int getDongari_id() {
		return dongari_id;
	}
	
	public int getUser_id() {
		return user_id;
	}
}
