package kr.or.ksmart.driverdb;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DriverDB {
	//01����̹��ε���02DB������ Connection��ü �ּҰ� ����
	public Connection driverDbcon() throws ClassNotFoundException, SQLException {
		System.out.println("01����̹��ε���DB����");
		Class.forName("com.mysql.jdbc.Driver");

		String jdbcDriver = "jdbc:mysql://localhost:3306/dev28db?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev28id";
		String dbPass = "dev28pw";
		
		Connection reconn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(reconn + "<-- reconn");

		return reconn;
	}
}
