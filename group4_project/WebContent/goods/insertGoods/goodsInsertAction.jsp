<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.Seller"%>
<%@ page import="group4_project.SellerDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>상품 등록 처리</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			String memberId = (String)session.getAttribute("sendId");
			String sellCategory = request.getParameter("sellCategory");
			String sellName = request.getParameter("sellName");
			String sellMenu = request.getParameter("sellMenu");
			String sellPrice = request.getParameter("sellPrice");
			String sellAddress = request.getParameter("sellAddressText1") + request.getParameter("sellAddressText2");
			String sellContent = request.getParameter("sellContent");
			System.out.println(sellCategory +"<- sellCategory");
			System.out.println(sellName +"<- sellName");
			System.out.println(sellMenu +"<- sellMenu");
			System.out.println(sellPrice +"<- sellPrice");
			System.out.println(sellAddress +"<- sellAddress");
			System.out.println(sellContent +"<- sellContent");
			
			Seller seller = new Seller();
			SellerDao sellerDao = new SellerDao();
			
			seller.setSell_id(memberId);
			seller.setSell_name(sellName);
			seller.setSell_category(sellCategory);
			seller.setSell_menu(sellMenu);
			seller.setSell_price(sellPrice);
			seller.setSell_address(sellAddress);
			seller.setSell_content(sellContent);
			
			sellerDao.insertSeller(seller);
		%>
	</body>
</html>