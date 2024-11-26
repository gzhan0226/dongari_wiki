package question;

import java.sql.Connection;

import db.DBUtil;

public class QuestionDao {
	
	private DBUtil dbUtil = new DBUtil();
	private Connection conn;
	
	public QuestionDao() {
		conn = dbUtil.open();
	}
	
	 
}
