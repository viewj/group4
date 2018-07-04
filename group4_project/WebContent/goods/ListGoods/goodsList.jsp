<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="group4_project.SellerDao"%>
<%@ page import="group4_project.Seller"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>음식 메뉴상품 리스트</title>
	</head>
	<body>
		<%
			SellerDao sellerDao = new SellerDao();
			ArrayList<Seller> getTotalList = sellerDao.ListSellerSelect();
			
		%>
		<h2>음식 메뉴</h2>
		<table border="1">
			<tr>
				<td>가게이름</td>
				<td>음식 메뉴 </td>
				<td>메뉴 가격 </td>
				<td>가게 주소 </td>
			</tr>
		<%
			for(int i=0; i<getTotalList.size(); i++) {
				Seller seller = getTotalList.get(i);
				 System.out.println(i + " : " + getTotalList.get(i).getClass()); //Class 알아볼 때
		%>
				<tr>
					<td><a href="./goodsDetail.jsp?sendCode=<%=seller.getSellCode()%>"><%=seller.getSellName()%></a></td>
					<td><%=seller.getSellMenu()%></td>
					<td><%=seller.getSellPrice()%></td>
					<td><%=seller.getSellAddress()%></td>
				</tr>
		<%
			}
		%>
		</table>
	</body>
</html>