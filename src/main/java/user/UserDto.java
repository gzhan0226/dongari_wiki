package user;

public class UserDto {
	private int id; 
	private String studentnumber;
	private String realname; 
	private String username;
	private String password; 
	
	public UserDto(int id, String studentnumber, String realname, String username, String password) {
		this.id = id;
		this.studentnumber = studentnumber;
		this.realname = realname; 
		this.username = username;
		this.password = password;
	}
	//Getter
	public int getId() {
		return id;
	}
	public String getRealname() {
		return realname;
	}
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public String getStudentnumber() {
		return studentnumber;
	}
	
	//Setter
		public void setId(int id) {
			this.id = id; 
		}
		public void setRealname(String realname) {
			this.realname = realname;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public void setStudentNumber(String studentnumber) {
			this.studentnumber = studentnumber;
		}
}

