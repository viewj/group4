<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.Seller"%>
<%@ page import="group4_project.SellerDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>메뉴 상세정보</title>
	</head>
	<body>
		<%
			SellerDao sellerDao = new SellerDao();
			Seller seller = sellerDao.detailSellerSelect();
			
		%>
		<h2>상세 정보</h2>
		<table>
			<tr>
				<td>등록한 아아디 :</td>
				<td><%=seller.getMemberId()%></td>
			</tr>
			<tr>
				<td>가게 이름 :</td>
				<td><%=seller.getSellName()%></td>
			</tr>
			<tr>
				<td>주소 :</td>
				<td><%=seller.getSellAddress()%></td>
			</tr>
			<tr>
				<td>카테고리 :</td>
				<td><%=seller.getSellCategory()%></td>
			</tr>
			<tr>
				<td>메뉴 :</td>
				<td><%=seller.getSellMenu()%></td>
			</tr>
			<tr>
				<td>가격 :</td>
				<td><%=seller.getSellPrice()%></td>
			</tr>
			<tr>
				<td>가게 설명 or 메뉴 설명 :</td>
				<td><%=seller.getSellContent()%></td>
			</tr>
			<tr>
				<td>등록된 날짜  :</td>
				<td><%=seller.getSellDate()%></td>
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/uodateGoods/goodsUpdateForm.jsp?sendCode=<%=seller.getSellCode()%>">수정</a></td>
				<td><a href="<%=request.getContextPath()%>/*?sendCode=<%=seller.getSellCode()%>">삭제</a></td>
			</tr>
			
		</table>
	</body>
</html>