<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.Seller"%>
<%@ page import="group4_project.SellerDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�޴� ������</title>
	</head>
	<body>
		<%
			SellerDao sellerDao = new SellerDao();
			Seller seller = sellerDao.detailSellerSelect();
			
		%>
		<h2>�� ����</h2>
		<table>
			<tr>
				<td>����� �ƾƵ� :</td>
				<td><%=seller.getMemberId()%></td>
			</tr>
			<tr>
				<td>���� �̸� :</td>
				<td><%=seller.getSellName()%></td>
			</tr>
			<tr>
				<td>�ּ� :</td>
				<td><%=seller.getSellAddress()%></td>
			</tr>
			<tr>
				<td>ī�װ� :</td>
				<td><%=seller.getSellCategory()%></td>
			</tr>
			<tr>
				<td>�޴� :</td>
				<td><%=seller.getSellMenu()%></td>
			</tr>
			<tr>
				<td>���� :</td>
				<td><%=seller.getSellPrice()%></td>
			</tr>
			<tr>
				<td>���� ���� or �޴� ���� :</td>
				<td><%=seller.getSellContent()%></td>
			</tr>
			<tr>
				<td>��ϵ� ��¥  :</td>
				<td><%=seller.getSellDate()%></td>
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/uodateGoods/goodsUpdateForm.jsp?sendCode=<%=seller.getSellCode()%>">����</a></td>
				<td><a href="<%=request.getContextPath()%>/*?sendCode=<%=seller.getSellCode()%>">����</a></td>
			</tr>
			
		</table>
	</body>
</html>