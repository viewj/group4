<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberInsertForm Page</title>
	</head>
	<body>
		<h2>ȸ������ȭ��</h2>
		<form action="<%= request.getContextPath() %>/member/insertMember/memberInsertAction.jsp" method="post">
			<table border="1">
			<tr>
				<td>���̵�</td>
				<td><input type="text" name="memberId" size="20"></td>
			</tr>
			<tr>
				<td>��ȣ</td>
				<td><input type="text" name="memberPw" size="20"></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><input type="text" name="memberName" size="20"></td>
			</tr>
			<tr>
				<td>����</td>
				<td>
					<select name="memberLevel">
					    <option value="������">������</option>
					    <option value="�Ǹ���">�Ǹ���</option>
					    <option value="������" selected="selected">������</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td>
					<select name="memberGender">
					    <option value="����" selected="selected">����</option>
					    <option value="����" >����</option>
					</select>
				</td>
			</tr>
			<tr>
				<td> �ּ�</td>
				<td>
					<input type="text" name="memberAddress" size="20">
				</td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="ȸ�����Թ�ư"></td>
			</tr>
			</table>
		</form>
	</body>
</html>