package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBUtil;

public class UserDao {
	
	private DBUtil dbUtil = new DBUtil();
	
	private Connection conn;
	
	public UserDao() {
		conn = dbUtil.open();
	}
	
	public void save(UserDto userDto) {
		conn = dbUtil.open();
		String sql = "insert into user values(NULL,?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userDto.getStudentnumber());
			pstmt.setString(2, userDto.getRealname());
			pstmt.setString(3, userDto.getUsername());
			pstmt.setString(4, userDto.getPassword());
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public UserDto findByUsername(String username) {
		conn = dbUtil.open();
		String sql = "select * from user where username = ?";
		UserDto userDto = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				userDto = new UserDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return userDto;
	}
}
