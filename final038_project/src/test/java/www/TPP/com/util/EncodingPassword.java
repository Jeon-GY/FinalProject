package www.TPP.com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncodingPassword {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl"; // url 은 자원이다.
	private static final String USER_ID = "system";
	private static final String PASSWORD = "1234";

	private static Connection conn() {
		try {
			// 주어진(매개변수) 문자열을 기준으로 클래스 찾기 -> class.forname
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Success");
			Connection connection = DriverManager.getConnection(URL, USER_ID, PASSWORD);
			System.out.println("Connection Success");
			return connection;

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Test
	public void test() {
		String[] userId = {"admin", "seller1", "seller2", "customer1", "customer2", "customer3"};
		
		Connection conn = conn();
		if (conn == null)
			return;
		try {
			PreparedStatement pstmt = conn.prepareStatement("UPDATE f_party SET user_pwd=? WHERE user_id = ?");
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			for(String id : userId) {
				String securePw = encoder.encode("1234");
				pstmt.setString(1, securePw);
				pstmt.setString(2, id);
				int ret = pstmt.executeUpdate();
				System.out.println("Return : " + ret );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
