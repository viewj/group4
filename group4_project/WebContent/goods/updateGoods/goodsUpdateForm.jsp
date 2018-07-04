<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.SellerDao" %>
<%@ page import="group4_project.Seller" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>��ϵ� ��ǰ ���� ȭ��</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			int sellerCode = Integer.parseInt(request.getParameter("sendCode"));
			SellerDao sellerDao = new SellerDao();
			Seller seller = sellerDao.updateSellerSelect(sellerCode);
			
		%>
		<h2>��ǰ ����</h2>
			<form action="./goodsUpdateAction.jsp" method="post">
				<table>
					<tr>
						<td>ī�װ� :</td>
						<td>
							<select name="sellCategory">
								<option>=����=</option>
								<option>�ѽ�</option>
								<option>�Ͻ�</option>
								<option>�߽�</option>
								<option>���</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>���� �̸� :</td>
						<td><input type="text" name="sellName" value="<%=seller.getSellName()%>"></td>
					</tr>
					<tr>
						<td>�޴� �̸� :</td>
						<td><input type="text" name="sellMenu" value="<%=seller.getSellMenu()%>"></td>
					</tr>
					<tr>
						<td>�Ǹ� �ݾ� :</td>
						<td><input type="text" name="sellPrice" value="<%=seller.getSellPrice()%>"></td>
					</tr>
					<tr>
						<td>�Ǹ��ϴ� �ּ� :</td>
						<td><input type="text" name="sellAddressText" value="<%=seller.getSellAddress()%>"></td>
					</tr>
					<tr>
						<td>���� or �޴� �Ұ� :</td>
						<td><input type="text" name="sellContent" value="<%=seller.getSellContent()%>"><td>
					</tr>
					<tr>
						<td><input type="hidden" name="sellCode" value="<%=seller.getSellCode()%>"></td>
						<td><input type="submit" value="��� �ϱ�"></td>
					</tr>
				</table>
			</form>
	</body>
</html>