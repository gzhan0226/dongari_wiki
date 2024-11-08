package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
			pstmt.setString(1, userDto.getStudentNumber());
			pstmt.setString(2, userDto.getRealname());
			pstmt.setString(3, userDto.getUsername());
			pstmt.setString(4, userDto.getPassword());
			System.out.print(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
