package dongari;

public class DongariDto {
	private int id; 
	private int user_id;
	private String title; 
	private String summary;
	private String body; 
	private int category_id; 
	private String apply_start;
	private String apply_end;
	private String apply_link;
	private int member_num;
	private String sns_link;
	private String location;
	
	public DongariDto(int id, int user_id, String title, String summary, String body, 
			int category_id, String apply_start, String apply_end, String apply_link,
			int member_num, String sns_link ,String location) {
		this.id = id;
		this.user_id = user_id;
		this.title = title;
		this.summary = summary;
		this.body = body;
		this.category_id = category_id;
		this.apply_start = apply_start;
		this.apply_end = apply_end;
		this.apply_link = apply_link;
		this.member_num = member_num;
		this.sns_link = sns_link;
		this.location = location;
	}
	//Getter
	public int getId() {
        return id;
    }

    public int getUser_id() {
        return user_id;
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

    public int getCategory_id() {
        return category_id;
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

    public int getMember_num() {
        return member_num;
    }

    public String getSns_link() {
        return sns_link;
    }

    public String getLocation() {
        return location;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
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

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
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

    public void setMember_num(int member_num) {
        this.member_num = member_num;
    }

    public void setSns_link(String sns_link) {
        this.sns_link = sns_link;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
