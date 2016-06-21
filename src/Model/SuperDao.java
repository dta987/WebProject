package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SuperDao {
	
	protected String driver = "oracle.jdbc.driver.OracleDriver";
	protected String url = "jdbc:oracle:thin:@localhost:1521:xe";
	protected String id = "proman";
	protected String password = "oracle";	
	protected Connection conn = null;
	
	public Connection getConnection() {
		return conn;
	}
	
	public SuperDao() {		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, password);
			if (conn != null) {
				System.out.println("DB연결 성공");
			} else {
				System.out.println("DB연결 실패");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("드라이브를 찾을수 없습니다.");
			e.printStackTrace();
		}

	}
	
	public void getCloseConnection() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
