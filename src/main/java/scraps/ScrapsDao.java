package scraps;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBUtil;

public class ScrapsDao {
	
	private DBUtil dbUtil = new DBUtil();
	private Connection conn;
	
	public ScrapsDao() {
		conn = dbUtil.open();
	}
	
	public void save(int dongari_id, int user_id) {
		conn = dbUtil.open();
		String sql = "INSERT INTO scraps VALUES(NULL,?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dongari_id);
			pstmt.setInt(2, user_id);

			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int dongari_id, int user_id) {
		conn = dbUtil.open();
		String sql = "DELETE FROM scraps WHERE dongari_id = ? AND user_id = ?;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dongari_id);
			pstmt.setInt(2, user_id);

			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ScrapsDto find(int dongari_id, int user_id) {
		conn = dbUtil.open();
		String sql = "Select * FROM scraps WHERE dongari_id =? AND user_id = ?";
		ScrapsDto scrapsDto = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dongari_id);
			pstmt.setInt(2, user_id);

			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				scrapsDto = new ScrapsDto(rs.getInt(1), rs.getInt(2), rs.getInt(3));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return scrapsDto;
	}
	public List<ScrapsDto> findAllByUserId(int user_id) {
		conn = dbUtil.open();
		String sql = "Select * FROM scraps WHERE user_id = ?";
		List<ScrapsDto> scrapsDtoList = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_id);

			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				 scrapsDtoList.add(new ScrapsDto(rs.getInt(1), rs.getInt(2), rs.getInt(3))) ;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return scrapsDtoList;
	}
}
