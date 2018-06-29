<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>

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
		 
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<-- send_id");
Mdao dao = new Mdao();
Member m = dao.mSelectforUpdate(send_id);
System.out.println(m+ "<- m");

String dbid = m.getM_id();
String dbpw = m.getM_pw();
String dblevel = m.getM_level();
String dbname = m.getM_name();
String dbemail = m.getM_email();
%>

<form action="<%= request.getContextPath() %>/mupdate/m_update_pro.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="m_id" size="20" value="<%= dbid %>" readonly></td>
<tr>
<tr>
	<td>암호</td>
	<td><input type="text" name="m_pw" size="20" value="<%= dbpw %>"></td>
<tr>
<tr>
	<td>권한</td>
	<td><input type="text" name="m_level" size="20" value="<%= dblevel %>"></td>
<tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="m_name" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="m_email" size="20" value="<%= dbemail %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="회원수정버튼"></td>
</tr>
</table>
</form>


		 </div>
		 <!-- End Right Column -->
		<%@ include file="/module/hadan.jsp" %>

   </div>
   <!-- End Wrapper -->
</body>
</html>








