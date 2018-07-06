package group4_project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connDB.DriverDB;
import group4_project.Member;

public class MemberDao {
	ResultSet resultset = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ArrayList<Member> totalList = null;
	ArrayList<Member> searchTotalList = null;
	
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
	
	public ArrayList<Member> totalMemberList(int begin ,int rowPerPage) {
		DriverDB sqlCon = new DriverDB();
		conn = sqlCon.driverDbcon();
		String sql = "SELECT member_id, member_pw, member_name, member_level, member_gender, member_address, left(member_date, 10) AS member_date FROM member ORDER BY member_date DESC LIMIT ? ,?";
		Member member = null;
		totalList = new ArrayList<Member>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, begin);
			pstmt.setInt(2, rowPerPage);
			resultset = pstmt.executeQuery();
			
			while (resultset.next()) {
				member = new Member();
				member.setMemberId(resultset.getString("member_id"));
				member.setMemberPw(resultset.getString("member_pw"));
				member.setMemberName(resultset.getString("member_name"));
				member.setMemberLevel(resultset.getString("member_level"));
				member.setMemberGender(resultset.getString("member_gender"));
				member.setMemberAddress(resultset.getString("member_address"));
				member.setMemberDate(resultset.getString("member_date"));
				totalList.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("쿼리문을 실행할 수 없습니다 <--totalMemberList()");
		}finally{
			if (resultset != null) try { resultset.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return totalList;
	}
	
	public ArrayList<Member> searchTotalMemberList(String searchList, String searchText, int begin ,int rowPerPage) {
		DriverDB sqlCon = new DriverDB();
		conn = sqlCon.driverDbcon();
		String sql = null;
		if (searchList.equals("아이디")) {
			sql = "SELECT member_id, member_pw, member_name, member_level, member_gender, member_address, left(member_date, 10) AS member_date FROM member where member_id LIKE ? ORDER BY member_date DESC LIMIT ? ,?";
		} else if (searchList.equals("이름")) {
			sql = "SELECT member_id, member_pw, member_name, member_level, member_gender, member_address, left(member_date, 10) AS member_date FROM member where member_name LIKE ? ORDER BY member_date DESC LIMIT ? ,?";
		} else if (searchList.equals("권한")) {
			sql = "SELECT member_id, member_pw, member_name, member_level, member_gender, member_address, left(member_date, 10) AS member_date FROM member where member_level LIKE ? ORDER BY member_date DESC LIMIT ? ,?";
		} else if (searchList.equals("성별")) {
			sql = "SELECT member_id, member_pw, member_name, member_level, member_gender, member_address, left(member_date, 10) AS member_date FROM member where member_gender LIKE ? ORDER BY member_date DESC LIMIT ? ,?";
		} else if (searchList.equals("주소")) {
			sql = "SELECT member_id, member_pw, member_name, member_level, member_gender, member_address, left(member_date, 10) AS member_date FROM member where member_address LIKE ? ORDER BY member_date DESC LIMIT ? ,?";
		} else if (searchList.equals("가입날짜")) {
			sql = "SELECT member_id, member_pw, member_name, member_level, member_gender, member_address, left(member_date, 10) AS member_date FROM member where member_date LIKE ? ORDER BY member_date DESC LIMIT ? ,?";
		}
		Member member = null;
		searchTotalList = new ArrayList<Member>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchText+"%");
			pstmt.setInt(2, begin);
			pstmt.setInt(3, rowPerPage);
			resultset = pstmt.executeQuery();
			
			while (resultset.next()) {
				member = new Member();
				member.setMemberId(resultset.getString("member_id"));
				member.setMemberPw(resultset.getString("member_pw"));
				member.setMemberName(resultset.getString("member_name"));
				member.setMemberLevel(resultset.getString("member_level"));
				member.setMemberGender(resultset.getString("member_gender"));
				member.setMemberAddress(resultset.getString("member_address"));
				member.setMemberDate(resultset.getString("member_date"));
				searchTotalList.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("쿼리문을 실행할 수 없습니다 <--searchTotalMemberList()");
		}finally{
			if (resultset != null) try { resultset.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return searchTotalList;
	}
	
	public Member selectMember(String id) {
		DriverDB sqlCon = new DriverDB();
		conn = sqlCon.driverDbcon();
		String sql = "SELECT member_id, member_pw, member_name, member_level, member_gender, member_address, member_date FROM member where member_id=?";
		Member member = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			resultset = pstmt.executeQuery();
			
			if(resultset.next()) {
				member = new Member();
				member.setMemberId(resultset.getString("member_id"));
				member.setMemberPw(resultset.getString("member_pw"));
				member.setMemberName(resultset.getString("member_name"));
				member.setMemberLevel(resultset.getString("member_level"));
				member.setMemberGender(resultset.getString("member_gender"));
				member.setMemberAddress(resultset.getString("member_address"));
				member.setMemberDate(resultset.getString("member_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("쿼리문을 실행할 수 없습니다. <--selectMember()");
		}finally{
			if (resultset != null) try { resultset.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return member;
	}
	
	public void updateMember(Member member) {
		DriverDB sqlCon = new DriverDB();
		conn = sqlCon.driverDbcon();
		String sql = "UPDATE member SET member_name=?, member_level=?, member_gender=?, member_address=? WHERE member_id=? and member_pw=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberName());
			pstmt.setString(2, member.getMemberLevel());
			pstmt.setString(3, member.getMemberGender());
			pstmt.setString(4, member.getMemberAddress());
			pstmt.setString(5, member.getMemberId());
			pstmt.setString(6, member.getMemberPw());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("쿼리문을 실행할 수 없습니다. <--updateMember()");
		}finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	public void deleteMember(String id, String pw) {
		DriverDB sqlCon = new DriverDB();
		conn = sqlCon.driverDbcon();
		String sql = "DELETE FROM member where member_id=? and member_pw=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("쿼리문을 실행할 수 없습니다. <--deleteMember()");
		}finally{
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	public int pagePerRow(int rowPerPage) {
				
		int totalPage = 0;
		int listPage = 0;
		DriverDB driverDb = new DriverDB();
		
		try {
			conn = driverDb.driverDbcon();
			String totalPageQuery = "SELECT COUNT(member_id) AS memberId FROM member";
			pstmt = conn.prepareStatement(totalPageQuery);
			
			resultset = pstmt.executeQuery();
			
			if(resultset.next()) {
				totalPage = resultset.getInt("memberId");
			}
			
			listPage = totalPage / rowPerPage;
			
			if(totalPage % rowPerPage != 0) {
				listPage++;
			}
			
		}catch(SQLException close) {
			close.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return listPage;
	}
	
	public ArrayList<Member> searchPageList(String searchList, String searchText) {
				
		DriverDB driverDb = new DriverDB();
		conn = driverDb.driverDbcon();
		String sql = null;
		Member member = null;
		searchTotalList = new ArrayList<Member>();
		
		try {
									
			if (searchList.equals("아이디")) {
				sql = "SELECT * FROM member where member_id LIKE ?";
			} else if (searchList.equals("이름")) {
				sql = "SELECT * FROM member where member_name LIKE ?";
			} else if (searchList.equals("권한")) {
				sql = "SELECT * FROM member where member_level LIKE ?";
			} else if (searchList.equals("성별")) {
				sql = "SELECT * FROM member where member_gender LIKE ?";
			} else if (searchList.equals("주소")) {
				sql = "SELECT * FROM member where member_address LIKE ?";
			} else if (searchList.equals("가입날짜")) {
				sql = "SELECT * FROM member where member_date LIKE ?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchText+"%");
			resultset = pstmt.executeQuery();
						
			while(resultset.next()) {
				member = new Member();
				member.setMemberId(resultset.getString("member_id"));
				member.setMemberPw(resultset.getString("member_pw"));
				member.setMemberName(resultset.getString("member_name"));
				member.setMemberLevel(resultset.getString("member_level"));
				member.setMemberGender(resultset.getString("member_gender"));
				member.setMemberAddress(resultset.getString("member_address"));
				member.setMemberDate(resultset.getString("member_date"));
				searchTotalList.add(member);
			}
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("쿼리문을 실행할 수 없습니다. <--searchPageList()");
		}finally {
			if (resultset != null) try { resultset.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return searchTotalList;
	}
	
	public int searchPage(String searchList, String searchText, int rowPerPage) {
		
		int totalPage = 0;
		int listPage = 0;
		DriverDB driverDb = new DriverDB();
		String sql = null;
		try {
			conn = driverDb.driverDbcon();
						
			if (searchList.equals("아이디")) {
				sql = "SELECT COUNT(member_id) AS total FROM member where member_id LIKE ?";
			} else if (searchList.equals("이름")) {
				sql = "SELECT COUNT(member_name) AS total FROM member where member_id LIKE ?";
			} else if (searchList.equals("권한")) {
				sql = "SELECT COUNT(member_level) AS total FROM member where member_id LIKE ?";
			} else if (searchList.equals("성별")) {
				sql = "SELECT COUNT(member_gender) AS total FROM member where member_id LIKE ?";
			} else if (searchList.equals("주소")) {
				sql = "SELECT COUNT(member_address) AS total FROM member where member_id LIKE ?";
			} else if (searchList.equals("가입날짜")) {
				sql = "SELECT COUNT(member_date) AS total FROM member where member_id LIKE ?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchText+"%");
			
			resultset = pstmt.executeQuery();
			
			while(resultset.next()) {
				totalPage = resultset.getInt("total");
			}
			
			listPage = totalPage / rowPerPage;
			
			if(totalPage % rowPerPage != 0) {
				listPage++;
			}
			
		}catch(SQLException close) {
			close.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return listPage;
	}

}
