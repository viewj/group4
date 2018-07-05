<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.SellerDao" %>
<%@ page import="group4_project.Seller" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>수정 처리 화면</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		
			int sellCode = Integer.parseInt(request.getParameter("sellCode"));
			String sellCategory = request.getParameter("sellCategory");
			String sellName = request.getParameter("sellName");
			String sellMenu = request.getParameter("sellMenu");
			String sellPrice = request.getParameter("sellPrice");
			String sellAddress = request.getParameter("sellAddressText");
			String sellContent = request.getParameter("sellContent");
			
			System.out.println(sellCode +"<- sellCode");
			System.out.println(sellCategory +"<- sellCategory");
			System.out.println(sellName +"<- sellName");
			System.out.println(sellMenu +"<- sellMenu");
			System.out.println(sellPrice +"<- sellPrice");
			System.out.println(sellAddress +"<- sellAddress");
			System.out.println(sellContent +"<- sellContent");
			
			Seller seller = new Seller();
			
			seller.setSellCode(sellCode);
			seller.setSellName(sellName);
			seller.setSellMenu(sellMenu);
			seller.setSellCategory(sellCategory);
			seller.setSellPrice(sellPrice);
			seller.setSellAddress(sellAddress);
			seller.setSellContent(sellContent);
			
			SellerDao sellerDao = new SellerDao();
			sellerDao.updateSeller(seller);
		%>
	</body>
</html>