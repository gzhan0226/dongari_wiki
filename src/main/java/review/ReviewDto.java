package review;

public class ReviewDto {
	private int id; 
	private int user_id;
	private int dongari_id; 
	
	private String title; 
	private String body; 
	
	private int atm;
	private int act;
	private int man;
	
	private String username;
	private double total_rating;
	
	public ReviewDto(int id, int user_id, int dongari_id, String title, String body, int atm, int act, int man
			,String username, double total_rating) {
        this.id = id;
        this.user_id = user_id;
        this.dongari_id = dongari_id;
        this.title = title;
        this.body = body;
        this.atm = atm;
        this.act = act;
        this.man = man;
        this.username = username;
        this.total_rating = total_rating;
    }
    
    // Getters
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
    
    public int getAtm() {
        return atm;
    }
    
    public int getAct() {
        return act;
    }
    
    public int getMan() {
        return man;
    }
    
    public String getUsername() {
    	return username;
    }
    
    public double getTotal_rating() {
    	return total_rating;
    }
    
    // Setters
    public void setId(int id) {
        this.id = id;
    }
    
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    
    public void setDongari_id(int dongari_id) {
        this.dongari_id = dongari_id;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public void setBody(String body) {
        this.body = body;
    }
    
    public void setAtm(int atm) {
        this.atm = atm;
    }
    
    public void setAct(int act) {
        this.act = act;
    }
    
    public void setMan(int man) {
        this.man = man;
    }
	
}
