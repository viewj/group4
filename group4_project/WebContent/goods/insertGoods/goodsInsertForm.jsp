<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>��ǰ ��� ȭ��</title>
	</head>
	<body>
		<%
			session.getAttribute("memberName");
			session.getAttribute("memberPw");
			session.getAttribute("memberLevel");
		%>
		<h2>��ǰ ���</h2>
			<form action="./goodsInsertAction.jsp" method="post">
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
						<td><input type="text" name="sellName"></td>
					</tr>
					<tr>
						<td>�޴� �̸� :</td>
						<td><input type="text" name="sellMenu"></td>
					</tr>
					<tr>
						<td>�Ǹ� �ݾ� :</td>
						<td><input type="text" name="sellPrice"></td>
					</tr>
					<tr>
						<td>�Ǹ��ϴ� �ּ� :</td>
						<td><input type="text" name="sellAddressText"></td>
					</tr>
					<tr>
						<td>���� or �޴� �Ұ� :</td>
						<td><input type="text" name="sellContent"><td>
					</tr>
					<tr>
						<td><input type="submit" value="��� �ϱ�"></td>
					</tr>
				</table>
			</form>
	</body>
</html>