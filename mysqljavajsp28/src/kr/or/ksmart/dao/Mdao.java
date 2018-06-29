package kr.or.ksmart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Member;

public class Mdao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<Member> alm = null;
	//05 전체회원 조회 메서드 선언
	public ArrayList<Member> mAllSelect() throws ClassNotFoundException, SQLException{
		System.out.println("05 mAllSelect Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		alm = new ArrayList<Member>();
		pstmt = conn.prepareStatement("select * from tb_member");
		rs = pstmt.executeQuery();
		Member m = null;
		while(rs.next()) {
			m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
			System.out.println(m + "<-- m mAllSelect Mdao.java");
			System.out.println(alm + "<-- alm mAllSelect Mdao.java");
			alm.add(m);
		}
		pstmt.close();
		conn.close();
		return alm;
	}
	
	//04 한명의 회원 조회 메서드 선언(수정화면위함)
	public Member mSelectforUpdate(String mid) throws ClassNotFoundException, SQLException {
		System.out.println("04 mSelectforUpdate Mdao.java");
		System.out.println("아이디값:" + mid);
		Member m = null;
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select * from tb_member where m_id=?");
		pstmt.setString(1, mid);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			m = new Member();
			m.setM_id(rs.getString("m_id"));
			m.setM_pw(rs.getString("m_pw"));
			m.setM_level(rs.getString("m_level"));
			m.setM_name(rs.getString("m_name"));
			m.setM_email(rs.getString("m_email"));
		}
		pstmt.close();
		conn.close();
		return m;
	}
	
	//03 삭제(탈퇴)처리 메서드선언
	public void mDelete(String mid) throws ClassNotFoundException, SQLException {
		System.out.println("03 mDelete Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"DELETE FROM tb_member WHERE m_id=?");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, mid);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	//02 수정처리 메서드 선언
	public void mUpdate(Member m) throws ClassNotFoundException, SQLException {
		System.out.println("02 mUpdate Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"UPDATE tb_member SET m_pw=?,m_level=?,m_name=?,m_email=? WHERE m_id=?");
		pstmt.setString(1, m.getM_pw());
		pstmt.setString(2, m.getM_level());
		pstmt.setString(3, m.getM_name());
		pstmt.setString(4, m.getM_email());
		pstmt.setString(5, m.getM_id());
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();	

	}
	//01_02입력처리 메서드 선언
	public void mInsert(Member m) throws SQLException, ClassNotFoundException{
		System.out.println("01_02 mInsert Mdao.java");
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();	
	}
	//01입력처리 메서드 선언
	public void mInsert(Member m,Connection conn) throws SQLException{
		//3단계 쿼리실행준비 부터 시작
		System.out.println("01_01 mInsert Mdao.java");
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_member VALUES (?, ?, ?, ?, ?)");
		pstmt.setString(1, m.getM_id());
		pstmt.setString(2, m.getM_pw());
		pstmt.setString(3, m.getM_level());
		pstmt.setString(4, m.getM_name());
		pstmt.setString(5, m.getM_email());
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}


}
