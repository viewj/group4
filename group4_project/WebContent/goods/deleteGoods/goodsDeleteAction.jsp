<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.SellerDao" %>
<!-- 2018.07.05 28기 전재현 -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>삭제 처리</title>
	</head>
	<body>
		<%
			int sellCode = Integer.parseInt(request.getParameter("sendCode"));
			String memberId = (String)session.getAttribute("sendId");
			String memberPass = request.getParameter("memberPassword");
			SellerDao sellerDao = new SellerDao();
			
			sellerDao.deleteSellerSelect(memberId ,memberPass ,sellCode);
		%>
	</body>
</html>