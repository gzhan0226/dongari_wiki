package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBUtil;
import dongari.DongariDto;

public class ReviewDao {
	
private DBUtil dbUtil = new DBUtil();
	
	private Connection conn;
	
	public ReviewDao() {
		conn = dbUtil.open();
	}
	public void save(ReviewDto reviewDto) {
		
		conn = dbUtil.open();
		String sql = "insert into review values(NULL,?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, reviewDto.getUser_id());
			pstmt.setInt(2, reviewDto.getDongari_id());
			
			pstmt.setString(3, reviewDto.getTitle());
			pstmt.setString(4, reviewDto.getBody());
			
			pstmt.setInt(5, reviewDto.getAtm());
			pstmt.setInt(6, reviewDto.getAct());
			pstmt.setInt(7, reviewDto.getMan());
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public List<ReviewDto> findAllByDongariId(int dongari_id) {
		
		conn = dbUtil.open();
		List<ReviewDto> reviewDtoList = new ArrayList<ReviewDto>();
		String sql = "SELECT * FROM review WHERE dongari_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, dongari_id);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				reviewDtoList.add(new ReviewDto(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5)
						,rs.getInt(6),rs.getInt(7),rs.getInt(8)));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return reviewDtoList;
	}
}
