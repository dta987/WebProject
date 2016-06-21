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
				System.out.println("DB���� ����");
			} else {
				System.out.println("DB���� ����");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("����̺긦 ã���� �����ϴ�.");
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
