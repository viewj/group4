<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.SellerDao"%>
<%@ page import="group4_project.Seller" %>
<%@ page import="java.util.ArrayList"%>
<!-- 2018.07.05 28�� ������ -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�˻� ���� ȭ��</title>
	</head>
	<body>
		<%
			String getTitle = request.getParameter("title");
			String getSellSearch = request.getParameter("sellSearch");
			
			SellerDao sellerDao = new SellerDao();
			ArrayList<Seller> searchList = sellerDao.SelectSearchList(getTitle ,getSellSearch);
		%>
	</body>
</html>