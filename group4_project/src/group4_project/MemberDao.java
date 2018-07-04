package group4_project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connDB.DriverDB;

public class MemberDao {
	ResultSet resultset = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
		
	public Member loginMember(String id, String pw) {
		DriverDB sqlCon = new DriverDB();
		conn = sqlCon.driverDbcon();
		String sql = "SELECT member_id, member_pw, member_name, member_level, member_gender, member_address, member_date FROM member WHERE member_id=? and member_pw=?";
		Member member = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			/*System.out.println(pstmt + "<---pstmt");*/
			resultset = pstmt.executeQuery();
			member = new Member();
			if(resultset.next()) {
				member.setMemberId(resultset.getString("member_id"));
				member.setMemberPw(resultset.getString("member_pw"));
				member.setMemberName(resultset.getString("member_name"));
				member.setMemberLevel(resultset.getString("member_level"));
				member.setMemberGender(resultset.getString("member_gender"));
				member.setMemberAddress(resultset.getString("member_address"));
				member.setMemberDate(resultset.getString("member_date"));
			}
		} catch (SQLException e) {
			System.out.println("쿼리문을 시작할 수 없습니다. 확인해주세요. <-- loginMember()");
			e.printStackTrace();
		}finally{
			if (resultset != null) try { resultset.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			
		}
		
		return member;
		
	}
	
	public void insertMember(Member member) {
		DriverDB sqlCon = new DriverDB();
		conn = sqlCon.driverDbcon();
		String sql = "INSERT INTO member(member_id, member_pw, member_name, member_level, member_gender, member_address, member_date) VALUES (?, ?, ?, ?, ?, ?, now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPw());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getMemberLevel());
			pstmt.setString(5, member.getMemberGender());
			pstmt.setString(6, member.getMemberAddress());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("쿼리문을 시작할 수 없습니다. 확인해주세요. <-- insertMember()");
		}finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
}
