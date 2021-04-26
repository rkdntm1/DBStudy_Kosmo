package oracle_db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateDBPrepared2 {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String USER_ID = "system";
	private static final String PASSWORD = "1234";

	private static Connection conn() {
		try {
			// 주어진 문자열을 기준으로 클래스 찾기
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver 찾기 성공");
			Connection connection = DriverManager.getConnection(URL, USER_ID, PASSWORD);
			System.out.println("connection 성공");
			return connection;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		Connection conn = conn();
		if (conn == null)
			return;
		try {
			PreparedStatement stmt = conn.prepareStatement("update t_book set price = ? where id = ?");
			stmt.setInt(1, 7500);
			stmt.setInt(2, 2);			
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
