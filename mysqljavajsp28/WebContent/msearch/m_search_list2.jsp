<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%@ include file="/msearch/m_search_form.jsp" %>
ȸ�� ����Ʈ <br>
<table width="100%" border="1">
<tr>
	<td>���̵�</td><td>���</td><td>����</td><td>�̸�</td><td>�̸���</td><td>����</td><td>����</td>
</tr>

<%
request.setCharacterEncoding("euc-kr");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<-- sk");
System.out.println(sv + "<-- sv");

try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/dev28db?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "dev28id";
	String dbPass = "dev28pw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");

	if(sk == null & sv == null){
		System.out.println("01����_sk null sv null");
		pstmt = conn.prepareStatement("select * from tb_member");
	}else if(sk != null & sv.equals("")){
		System.out.println("02����_sk �ְ� sv ����");
		pstmt = conn.prepareStatement("select * from tb_member");
	}else if(sk != null & sv != null){
		System.out.println("03����_�Ѵ� ���� �ִ�");
		if(sk.equals("m_id")){
			System.out.println("03_01 m_id ����");
			pstmt = conn.prepareStatement("select * from tb_member where m_id=?");
			pstmt.setString(1, sv);
		}else if(sk.equals("m_level")){
			System.out.println("03_02 m_level ����");
			pstmt = conn.prepareStatement("select * from tb_member where m_level=?");
			pstmt.setString(1, sv);
		}else if(sk.equals("m_name")){
			System.out.println("03_03 m_name ����");
			pstmt = conn.prepareStatement("select * from tb_member where m_name=?");
			pstmt.setString(1, sv);
		}else if(sk.equals("m_email")){
			System.out.println("03_03 m_email ����");
			pstmt = conn.prepareStatement("select * from tb_member where m_email=?");
			pstmt.setString(1, sv);
		}
		
	}

	
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs");
	while(rs.next()){
%>
	<tr>
		<td><%= rs.getString("m_id")%></td>
		<td><%= rs.getString("m_pw")%></td>
		<td><%= rs.getString("m_level")%></td>
		<td><%= rs.getString("m_name")%></td>
		<td><%= rs.getString("m_email")%></td>
		<td>
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= rs.getString("m_id")%>">������ư</a>			
		</td>
		<td>
<a href="<%= request.getContextPath() %>/mdelete/m_delete_pro.jsp?send_id=<%= rs.getString("m_id")%>">������ư</a>			
		</td>
	</tr>
	
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
</table>


