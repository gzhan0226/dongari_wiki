package user;

public class UserService {
	private UserDao userDao;
	
	public UserService() {
		userDao = new UserDao();
	}
	
	public void saveUser(UserDto userDto) {
		userDao.save(userDto);
	}
	
	public boolean login(String username, String password) {
		UserDto userDto = userDao.findByUsername(username);
		System.out.println(userDto.getUsername());
		System.out.println(userDto.getPassword());
		System.out.println(userDto.getPassword() == password);
		if (userDto.getPassword().equals(password)) {
			return true;
		}
		else 
			return false;
	}
}
