package question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBUtil;
import review.ReviewDto;

public class QuestionDao {
	
	private DBUtil dbUtil = new DBUtil();
	private Connection conn;
	
	public QuestionDao() {
		conn = dbUtil.open();
	}

	public void save(QuestionDto questionDto) {
		//QuestionDto(int id, int user_id, int dongari_id, String title, String body, String answer)
		conn = dbUtil.open();
		String sql = "insert into question values(NULL,?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, questionDto.getUser_id());
			pstmt.setInt(2, questionDto.getDongari_id());
			
			pstmt.setString(3, questionDto.getTitle());
			pstmt.setString(4, questionDto.getBody());
			
			pstmt.setString(5, questionDto.getAnswer());
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	} 
	
	public void edit(QuestionDto questionDto) {
		
		conn = dbUtil.open();
		String sql = "UPDATE question SET user_id = ?, "
				+ "dongari_id = ?, "
				+ "title = ?, "
				+ "body = ?, "
				+ "answer = ? "
				+ "WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, questionDto.getUser_id());
			pstmt.setInt(2, questionDto.getDongari_id());
			pstmt.setString(3, questionDto.getTitle());
			pstmt.setString(4, questionDto.getBody());
			
			pstmt.setString(5, questionDto.getAnswer());
			pstmt.setInt(6, questionDto.getId());
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<QuestionDto> findAllByDongariId(int dongari_id) {
		
		conn = dbUtil.open();
		List<QuestionDto> questionDtoList = new ArrayList<QuestionDto>();
		String sql = "SELECT * FROM question where dongari_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, dongari_id);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				questionDtoList.add(new QuestionDto(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6)));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return questionDtoList;
	}
	
	public List<QuestionDto> findAllByUserId(int user_id) {
		
		conn = dbUtil.open();
		List<QuestionDto> questionDtoList = new ArrayList<QuestionDto>();
		String sql = "SELECT * FROM question where user_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, user_id);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				questionDtoList.add(new QuestionDto(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6)));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return questionDtoList;
	}
	
	public QuestionDto findById(int id) {
		conn = dbUtil.open();
		QuestionDto questionDto = null;
		String sql = "SELECT * FROM question where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, id);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				questionDto = new QuestionDto(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return questionDto;
	}
}
