<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
										<!-- /layout28/css/main.css -->
</head>
<body>
   <!-- Begin Wrapper -->
   <div id="wrapper">
   
		<%@ include file="/module/top.jsp" %>
		<%@ include file="/module/left.jsp" %>

		 <!-- Begin Right Column -->
		 <div id="rightcolumn">

<%@ include file="/msearch/m_search_form.jsp" %>
회원 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>이메일</td><td>수정</td><td>삭제</td>
</tr>

<%
request.setCharacterEncoding("euc-kr");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sk = request.getParameter("sk");
String sv = request.getParameter("sv");
System.out.println(sk + "<-- sk");
System.out.println(sv + "<-- sv");

try{
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	System.out.println(conn + "<-- conn");

	if(sk == null & sv == null){
		System.out.println("01조건_sk null sv null");
		pstmt = conn.prepareStatement("select * from tb_member");
	}else if(sk != null & sv.equals("")){
		System.out.println("02조건_sk 있고 sv 공백");
		pstmt = conn.prepareStatement("select * from tb_member");
	}else if(sk != null & sv != null){
		System.out.println("03조건_둘다 값이 있다");
		pstmt = conn.prepareStatement("select * from tb_member where " + sk +"=?");
		pstmt.setString(1, sv);
	}

	System.out.println(pstmt + "<-- pstmt");
	out.println(pstmt + "<-- pstmt");
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
<a href="<%= request.getContextPath() %>/mupdate/m_update_form.jsp?send_id=<%= rs.getString("m_id")%>">수정버튼</a>			
		</td>
		<td>
<a href="<%= request.getContextPath() %>/mdelete/m_delete_pro.jsp?send_id=<%= rs.getString("m_id")%>">삭제버튼</a>			
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

		 </div>
		 <!-- End Right Column -->
		<%@ include file="/module/hadan.jsp" %>

   </div>
   <!-- End Wrapper -->
</body>
</html>
