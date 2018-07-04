package connDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	public Connection driverDbcon( ) {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/db23jgl?useUnicode=true&characterEncoding=euckr";
			String dbUser = "dbid23jgl";
			String dbPass = "dbpw23jgl";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("JDBC ������ �� �� �����ϴ� Ȯ�����ּ���. <-- driverDbcon()");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("�������� ������ �� �����ϴ�. Ȯ�����ּ���. <-- driverDbcon()");
		}
		return conn;	
	}
}
