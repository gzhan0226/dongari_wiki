package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;

public class DBUtil {
	
	private Connection conn;
	
	private static String dbUrl;
	private static String dbId;
	private static String dbPassword;
	
	String path = this.getClass().getResource("db.properties").getPath(); 
	
	public Connection open() {
		Properties properties = new Properties();

        try {
		 	FileReader resources= new FileReader(path);
		 	properties.load(resources);
		 	dbUrl = properties.getProperty("dbUrl");
		 	dbId = properties.getProperty("dbId");
 	        dbPassword = properties.getProperty("dbPassword");
        } catch (IOException e) {
            e.printStackTrace();
        }
		try {
			
			//JDBC ����̹��� �ε��Ѵ�.(���� Ŭ���� ������ Ȯ���Ѵ�)
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//Connection ��ü ������ ���ÿ� ����
			conn = DriverManager.getConnection(dbUrl, dbId, dbPassword);
			
			return conn;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
