package dongari;

public class DongariDto {
	private int id; 
	private int user_id;
	private int category_id; 
	private int member_num;
	
	private String img;
	private String title; 
	private String summary;
	private String body; 
	
	private String apply_start;
	private String apply_end;
	private String apply_link;
	
	private String sns_link;
	private String location;
	
	private String category_name;
	
	public DongariDto(int id, int user_id,int category_id, int member_num,
			String img, String title, String summary, String body, 
			 String apply_start, String apply_end, String apply_link,
			 String sns_link ,String location, String category_name) {
		this.id = id;
		this.user_id = user_id;
		this.category_id = category_id;
		this.member_num = member_num;
		
		this.img = img;
		this.title = title;
		this.summary = summary;
		this.body = body;
		
		this.apply_start = apply_start;
		this.apply_end = apply_end;
		this.apply_link = apply_link;
		
		this.sns_link = sns_link;
		this.location = location;
		this.category_name = category_name;
	}
	//Getter
	public int getId() {
        return id;
    }

    public int getUser_id() {
        return user_id;
    }
    
    public int getCategory_id() {
        return category_id;
    }
    
    public int getMember_num() {
        return member_num;
    }
    
    public String getImg() {
    	return img;
    }
    
    public String getTitle() {
        return title;
    }

    public String getSummary() {
        return summary;
    }

    public String getBody() {
        return body;
    }

    public String getApply_start() {
        return apply_start;
    }

    public String getApply_end() {
        return apply_end;
    }

    public String getApply_link() {
        return apply_link;
    }

    public String getSns_link() {
        return sns_link;
    }

    public String getLocation() {
        return location;
    }
    
    public String getCategory_name() {
        return category_name;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    
    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }
    
    public void setMember_num(int member_num) {
        this.member_num = member_num;
    }
    
    public void setImg(String img) {
    	this.img = img;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public void setApply_start(String apply_start) {
        this.apply_start = apply_start;
    }

    public void setApply_end(String apply_end) {
        this.apply_end = apply_end;
    }

    public void setApply_link(String apply_link) {
        this.apply_link = apply_link;
    }

    public void setSns_link(String sns_link) {
        this.sns_link = sns_link;
    }

    public void setLocation(String location) {
        this.location = location;
    }
    
    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }
}
