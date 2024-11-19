package likes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBUtil;

public class LikesDao {
	
	private DBUtil dbUtil = new DBUtil();
	private Connection conn;
	
	public LikesDao() {
		conn = dbUtil.open();
	}
	
	public void save(int review_id, int user_id) {
		conn = dbUtil.open();
		String sql = "INSERT INTO likes VALUES(NULL,?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			pstmt.setInt(2, user_id);

			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int review_id, int user_id) {
		conn = dbUtil.open();
		String sql = "DELETE FROM likes WHERE review_id = ? AND user_id = ?;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			pstmt.setInt(2, user_id);

			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public LikesDto find(int review_id, int user_id) {
		conn = dbUtil.open();
		String sql = "Select * FROM likes WHERE review_id =? AND user_id = ?";
		LikesDto likesDto = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			pstmt.setInt(2, user_id);

			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				likesDto = new LikesDto(rs.getInt(1), rs.getInt(2), rs.getInt(3));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return likesDto;
	}
	
	public int count(int review_id) {
		conn = dbUtil.open();
		String sql = "SELECT COUNT(*) AS like_count FROM likes WHERE review_id = ?;";
		int likeCount = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_id);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				 likeCount = rs.getInt("like_count");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return likeCount;
	}
}
