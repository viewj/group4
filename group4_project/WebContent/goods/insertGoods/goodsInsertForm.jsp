<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>상품 등록 화면</title>
	</head>
	<body>
		<%
			session.getAttribute("memberName");
			session.getAttribute("memberPw");
			session.getAttribute("memberLevel");
		%>
		<h2>상품 등록</h2>
			<form action="./goodsInsertAction.jsp" method="post">
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
						<td><input type="text" name="sellName"></td>
					</tr>
					<tr>
						<td>메뉴 이름 :</td>
						<td><input type="text" name="sellMenu"></td>
					</tr>
					<tr>
						<td>판매 금액 :</td>
						<td><input type="text" name="sellPrice"></td>
					</tr>
					<tr>
						<td>판매하는 주소 :</td>
						<td><input type="text" name="sellAddressText"></td>
					</tr>
					<tr>
						<td>가게 or 메뉴 소개 :</td>
						<td><input type="text" name="sellContent"><td>
					</tr>
					<tr>
						<td><input type="submit" value="등록 하기"></td>
					</tr>
				</table>
			</form>
	</body>
</html>