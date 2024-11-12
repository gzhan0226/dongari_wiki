package dongari;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import db.DBUtil;

public class DongariDao {
	
private DBUtil dbUtil = new DBUtil();
	
	private Connection conn;
	
	public DongariDao() {
		conn = dbUtil.open();
	}
	public void save(DongariDto dongariDto) {
		/*
		 * id, user_id, title, summary, 
		 * body, category_id, apply_start, apply_end, 
		 * apply_link, member_num, sns_link, location;
		 */
		conn = dbUtil.open();
		String sql = "insert into user values(NULL,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dongariDto.getUser_id());
			pstmt.setString(2, dongariDto.getTitle());
			pstmt.setString(3, dongariDto.getSummary());
			pstmt.setString(4, dongariDto.getBody());
			pstmt.setInt(5, dongariDto.getCategory_id());
			pstmt.setString(6, dongariDto.getApply_start());
			pstmt.setString(7, dongariDto.getApply_end());
			pstmt.setString(8, dongariDto.getApply_link());
			pstmt.setInt(9, dongariDto.getMember_num());
			pstmt.setString(10, dongariDto.getSns_link());
			pstmt.setString(11, dongariDto.getLocation());
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public List<DongariDto> findAll() {
		conn = dbUtil.open();
		List<DongariDto> dongariDtoList = null;
		String sql = "select * from dongari";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dongariDtoList.add(new DongariDto(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),
						rs.getInt(6),rs.getString(7),rs.getString(8), rs.getString(9), rs.getInt(10),
						rs.getString(11),rs.getString(12)));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return dongariDtoList;
	}
}
