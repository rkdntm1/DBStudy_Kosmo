package oracle_db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnDB {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String USER_ID = "system";
	private static final String PASSWORD = "1234";
	
	private static void conn() {
		try {
			// 주어진 문자열을 기준으로 클래스 찾기
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver 찾기 성공");
			Connection connection = DriverManager.getConnection(URL, USER_ID, PASSWORD);
			System.out.println("connection 성공");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} 
	}
	public static void main(String[] args) {
		conn();
	}
}
