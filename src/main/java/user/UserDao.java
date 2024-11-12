package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;//필요시 사용 
import java.util.Base64;

import db.DBUtil;
class PasswordHasher {
	public String result;
    private static String hashPassword(String password, byte[] salt) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(salt);
        byte[] hashedPassword = md.digest(password.getBytes());
        return Base64.getEncoder().encodeToString(hashedPassword);
    }

    private static byte[] getSalt() {
        byte[] salt = new byte[16];
        String hexSalt = "6FEC8B16A7A2C9356DA5241F8E8DC4B3";
        salt = hexStringToByteArray(hexSalt);
        return salt;
    }
    public static byte[] hexStringToByteArray(String hexString) {
        int length = hexString.length();
        byte[] byteArray = new byte[length / 2];
        
        for (int i = 0; i < length; i += 2) {
            byteArray[i / 2] = (byte) ((Character.digit(hexString.charAt(i), 16) << 4)
                                      + Character.digit(hexString.charAt(i + 1), 16));
        }
        return byteArray;
    }
    PasswordHasher(String password){
        byte[] salt = getSalt();
        String hashedPassword;
        try {
        	hashedPassword= hashPassword(password, salt);
        }
        catch(Exception e) {
        	System.out.print("hash error");
        	hashedPassword = null;
        }
        //System.out.println("Salt: " + Base64.getEncoder().encodeToString(salt)); 테스트용
        //System.out.println("Hashed Password: " + hashedPassword);
        result = hashedPassword;
    }
}


public class UserDao {
	
	private DBUtil dbUtil = new DBUtil();
	
	private Connection conn;
	
	public UserDao() {
		conn = dbUtil.open();
	}
	
	public void save(UserDto userDto) {
		conn = dbUtil.open();
		String sql = "insert into user values(NULL,?, ?, ?, ?)";
		PasswordHasher PH = new PasswordHasher(userDto.getStudentNumber());
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, PH.result);
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
