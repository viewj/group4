package group4_project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connDB.DriverDB;
import group4_project.Choice;

public class ChoiceDao {
	
	ResultSet resultset = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ArrayList<Choice> totalList = null;
	ArrayList<Choice> searchTotalList = null;
	
	public void insertChoice(String memberId, int sellCode) {
		DriverDB sqlCon = new DriverDB();
		conn = sqlCon.driverDbcon();
		String sql = "INSERT INTO menu_choice(member_id, sell_code, menu_date) VALUES (?, ?, now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, sellCode);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("쿼리문을 실행할 수 없습니다 <--insertChoice()");
		}finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
}
