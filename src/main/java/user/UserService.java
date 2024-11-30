package user;

public class UserService {
	private UserDao userDao;
	
	public UserService() {
		userDao = new UserDao();
	}
	
	public void saveUser(UserDto userDto) {
		userDao.save(userDto);
	}
	
	public int login(String username, String password) {
		UserDto userDto = userDao.findByUsername(username);
		if (userDto==null) {
			return 0;
		}
		System.out.println(userDto.getUsername());
		System.out.println(userDto.getPassword());
		if (userDto.getPassword().equals(password)) {
			return userDto.getId();
		}
		else 
			return 0;
	}
	
	public UserDto findByUsername(String username) {
		return userDao.findByUsername(username);
		
	}
}
