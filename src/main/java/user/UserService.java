package user;

public class UserService {
	private UserDao userDao;
	
	public UserService() {
		userDao = new UserDao();
	}
	
	public void saveUser(UserDto userDto) {
		userDao.save(userDto);
	}
}
