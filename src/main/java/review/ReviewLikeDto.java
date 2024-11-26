package review;

public class ReviewLikeDto {
	
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
	
	
	private int likeCount;
	private boolean likeCheck;
	
	public ReviewLikeDto(ReviewDto reviewDto, int likeCount, boolean likeCheck) {
		this.id = reviewDto.getId();
	    this.user_id = reviewDto.getUser_id();
	    this.dongari_id = reviewDto.getDongari_id();
	    this.title = reviewDto.getTitle();
	    this.body = reviewDto.getBody();
	    this.atm = reviewDto.getAtm();	     
	    this.act = reviewDto.getAct();
	    this.man = reviewDto.getMan();
	    this.username = reviewDto.getUsername();
	    this.total_rating = reviewDto.getTotal_rating();
	    
		this.likeCount = likeCount;
		this.likeCheck = likeCheck;
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
	
	public int getLikeCount() {
		return likeCount;
	}
	
	public boolean getLikeCheck() {
		return likeCheck;
	}
}
