package dongari;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBUtil;

public class DongariDao {
	
	private DBUtil dbUtil = new DBUtil();
	
	private Connection conn;
	
	public DongariDao() {
		conn = dbUtil.open();
	}
	public void save(DongariDto dongariDto) {
		
		conn = dbUtil.open();
		String sql = "INSERT INTO dongari VALUES(NULL,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dongariDto.getUser_id());
			pstmt.setInt(2, dongariDto.getCategory_id());
			pstmt.setInt(3, dongariDto.getMember_num());
			
			pstmt.setString(4, dongariDto.getImg());
			pstmt.setString(5, dongariDto.getTitle());
			pstmt.setString(6, dongariDto.getSummary());
			pstmt.setString(7, dongariDto.getBody());
			
			pstmt.setString(8, dongariDto.getApply_start());
			pstmt.setString(9, dongariDto.getApply_end());
			pstmt.setString(10, dongariDto.getApply_link());
			
			pstmt.setString(11, dongariDto.getSns_link());
			pstmt.setString(12, dongariDto.getLocation());
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public List<DongariDto> findAll() {
		conn = dbUtil.open();
		List<DongariDto> dongariDtoList = new ArrayList<DongariDto>();
		String sql = "SELECT d.*, c.name AS category_name FROM dongari d JOIN category c ON d.category_id = c.id";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dongariDtoList.add(new DongariDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),
						rs.getString(6),rs.getString(7),rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11),rs.getString(12),rs.getString(13), rs.getString(14)));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return dongariDtoList;
	}
	
	public DongariDto findById(int id) {
		conn = dbUtil.open();
		String sql = "SELECT d.*, c.name AS category_name FROM dongari d JOIN category c ON d.category_id = c.id WHERE d.id = ?";
		DongariDto dongariDto = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dongariDto = new DongariDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),
						rs.getString(6),rs.getString(7),rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11),rs.getString(12),rs.getString(13), rs.getString(14));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return dongariDto;
	}
	
	public void edit(DongariDto dongariDto) {
		
		conn = dbUtil.open();
		String sql = "UPDATE dongari SET user_id = ?, "
				+ "category_id = ?, "
				+ "member_num = ?, "
				+ "img = ?, "
				+ "title = ?, "
				+ "summary = ?, "
				+ "body = ?, "
				+ "apply_start = ?, "
				+ "apply_end = ?, "
				+ "apply_link = ?, "
				+ "sns_link = ?, "
				+ "location = ? WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dongariDto.getUser_id());
			pstmt.setInt(2, dongariDto.getCategory_id());
			pstmt.setInt(3, dongariDto.getMember_num());
			
			pstmt.setString(4, dongariDto.getImg());
			pstmt.setString(5, dongariDto.getTitle());
			pstmt.setString(6, dongariDto.getSummary());
			pstmt.setString(7, dongariDto.getBody());
			
			pstmt.setString(8, dongariDto.getApply_start());
			pstmt.setString(9, dongariDto.getApply_end());
			pstmt.setString(10, dongariDto.getApply_link());
			
			pstmt.setString(11, dongariDto.getSns_link());
			pstmt.setString(12, dongariDto.getLocation());
			pstmt.setInt(13, dongariDto.getId());
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public void DeleteById(int id) {
		conn = dbUtil.open();
		String sql = "DELETE FROM dongari WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			System.out.println(pstmt);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<DongariDto> findByUserId(int user_id) {
		conn = dbUtil.open();
		List<DongariDto> dongariDtoList = new ArrayList<DongariDto>();
		String sql = "SELECT d.*, c.name AS category_name FROM dongari d JOIN category c ON d.category_id = c.id WHERE d.user_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				dongariDtoList.add(new DongariDto(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4),rs.getString(5),
						rs.getString(6),rs.getString(7),rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11),rs.getString(12),rs.getString(13), rs.getString(14)));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return dongariDtoList;
	}
}
