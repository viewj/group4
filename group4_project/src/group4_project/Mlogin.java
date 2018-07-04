package group4_project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connDB.DriverDB;

public class Mlogin {
	public ResultSet mLogin(String id, String pw) {
		ResultSet resultset = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DriverDB sqlCon = new DriverDB();
		conn = sqlCon.driverDbcon();
		
		String sql = "SELECT member_id, member_pw, member_name, member_level, member_gender, member_address, member_date FROM member WHERE member_id=? and member_pw=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			/*System.out.println(pstmt + "<---pstmt");*/
			resultset = pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("쿼리문을 시작할 수 없습니다. 확인해주세요. <-- mLogin()");
			e.printStackTrace();
		}
		
		return resultset;
		
	}
}
