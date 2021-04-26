package oracle_db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InsertDBPrepared {
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
			PreparedStatement stmt = conn.prepareStatement("insert into t_book(id, title, "
					+ " publisher, publisher_year, price)"
					+ " values(?, ?, ?, ?, ?)");
			stmt.setInt(1, 5);
			stmt.setString(2, "dream of spring");
			stmt.setString(3, "dreameer");
			stmt.setString(4, "2021");
			stmt.setInt(5, 55555);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
