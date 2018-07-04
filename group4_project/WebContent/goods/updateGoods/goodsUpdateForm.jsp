<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.SellerDao" %>
<%@ page import="group4_project.Seller" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>등록된 상품 수정 화면</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			int sellerCode = Integer.parseInt(request.getParameter("sendCode"));
			SellerDao sellerDao = new SellerDao();
			Seller seller = sellerDao.updateSellerSelect(sellerCode);
			
		%>
		<h2>상품 수정</h2>
			<form action="./goodsUpdateAction.jsp" method="post">
				<table>
					<tr>
						<td>카테고리 :</td>
						<td>
							<select name="sellCategory">
								<option>=선택=</option>
								<option>한식</option>
								<option>일식</option>
								<option>중식</option>
								<option>양식</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>가게 이름 :</td>
						<td><input type="text" name="sellName" value="<%=seller.getSellName()%>"></td>
					</tr>
					<tr>
						<td>메뉴 이름 :</td>
						<td><input type="text" name="sellMenu" value="<%=seller.getSellMenu()%>"></td>
					</tr>
					<tr>
						<td>판매 금액 :</td>
						<td><input type="text" name="sellPrice" value="<%=seller.getSellPrice()%>"></td>
					</tr>
					<tr>
						<td>판매하는 주소 :</td>
						<td><input type="text" name="sellAddressText" value="<%=seller.getSellAddress()%>"></td>
					</tr>
					<tr>
						<td>가게 or 메뉴 소개 :</td>
						<td><input type="text" name="sellContent" value="<%=seller.getSellContent()%>"><td>
					</tr>
					<tr>
						<td><input type="hidden" name="sellCode" value="<%=seller.getSellCode()%>"></td>
						<td><input type="submit" value="등록 하기"></td>
					</tr>
				</table>
			</form>
	</body>
</html>