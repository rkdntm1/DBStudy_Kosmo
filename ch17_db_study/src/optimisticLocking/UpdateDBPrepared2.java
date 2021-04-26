package optimisticLocking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from t_some where id = 1");
			Some justRead = null;
			while (rs.next()) {
				justRead = new Some(rs.getLong("id"), rs.getString("name"), rs.getDate("update_dt"));
			}
			System.out.println(justRead.toString());
			
			justRead.setName("홍길동");
			
			PreparedStatement updateStmt = conn.prepareStatement("update t_some set name = ?, update_dt = sysdate where id = ? and update_dt <= ?");
			updateStmt.setString(1, justRead.getName());
			updateStmt.setLong(2, justRead.getId());
			updateStmt.setDate(3, (java.sql.Date)justRead.getUpdateDate());
			updateStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
