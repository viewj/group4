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
		
			String memberId = request.getParameter("memberId");
			String sellCategory = request.getParameter("sellCategory");
			String sellName = request.getParameter("sellName");
			String sellMenu = request.getParameter("sellMenu");
			String sellPrice = request.getParameter("sellPrice");
			String sellAddress = request.getParameter("sellAddressText");
			String sellContent = request.getParameter("sellContent");
			System.out.println(sellCategory +"<- sellCategory");
			System.out.println(sellName +"<- sellName");
			System.out.println(sellMenu +"<- sellMenu");
			System.out.println(sellPrice +"<- sellPrice");
			System.out.println(sellAddress +"<- sellAddress");
			System.out.println(sellContent +"<- sellContent");
			
			Seller seller = new Seller();
			SellerDao sellerDao = new SellerDao();
			
			seller.setMemberId(memberId);
			seller.setSellName(sellName);
			seller.setSellCategory(sellCategory);
			seller.setSellMenu(sellMenu);
			seller.setSellPrice(sellPrice);
			seller.setSellAddress(sellAddress);
			seller.setSellContent(sellContent);
			
			sellerDao.insertSeller(seller);
			
			response.sendRedirect(request.getContextPath()+"/goods/listGoods/goodsList.jsp");
		%>
	</body>
</html>