<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!-- 2018.07.05 28�� ������ -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>���� ó�� ȭ��</title>
	</head>
	<body>
		<%
			int sellCode = Integer.parseInt(request.getParameter("sendCode"));
			String memberId = (String)session.getAttribute("sendId");
			String memberLevel = (String)session.getAttribute("sendLevel");
			if(memberLevel.equals("�Ǹ���")) {
		%>
		<h2>�Խù� ���� �ϱ�</h2>
		<form action="./goodseDeleteAction.jsp" method="post">
			<table>
				<tr>
					<td>�н����带 �Է��ϼ��� :</td>
					<td><input type="password" name="member bbnPassword"></td>
				</tr>
				<tr>
					<td><input type="submit" value="�����ϱ�"></td>
					<td><input type="hidden" name="sendCode" value="sellCode"></td>
				</tr>
			</table>	
		</form>
		<%
			}
		%>
	</body>
</html>