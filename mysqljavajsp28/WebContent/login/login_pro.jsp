<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<-- id");
System.out.println(pw + "<-- pw");
try{
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println(conn + "<-- conn");
	
	pstmt = conn.prepareStatement("select m_id,m_pw,m_level,m_name from tb_member where m_id=?");
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		System.out.println("01 ���̵� ��ġ");
		if(pw.equals(rs.getString("m_pw"))){
			System.out.println("03 �α��μ���");
			session.setAttribute("S_ID", rs.getString("m_id"));
			session.setAttribute("S_NAME", rs.getString("m_name"));
			session.setAttribute("S_LEVEL", rs.getString("m_level"));
%>
<script type="text/javascript">
	alert('�α��μ���');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>
<%			
		}else{
			System.out.println("04 ��� ����ġ");
%>
<script type="text/javascript">
	alert('��� ����ġ');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>
<%
		}

	}else{
		System.out.println("02 ���̵� ����ġ");
%>
<script type="text/javascript">
	alert('���̵� ����ġ');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>
<%
	}
	
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>



