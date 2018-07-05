<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberInsertForm Page</title>
	</head>
	<body>
		<h2>회원가입화면</h2>
		<form action="<%= request.getContextPath() %>/member/insertMember/memberInsertAction.jsp" method="post">
			<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberId" size="20"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="text" name="memberPw" size="20"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="memberName" size="20"></td>
			</tr>
			<tr>
				<td>권한</td>
				<td>
					<select name="memberLevel">
					    <option value="관리자">관리자</option>
					    <option value="판매자">판매자</option>
					    <option value="구매자" selected="selected">구매자</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<select name="memberGender">
					    <option value="남자" selected="selected">남자</option>
					    <option value="여자" >여자</option>
					</select>
				</td>
			</tr>
			<tr>
				<td> 주소</td>
				<td>
					<input type="text" name="memberAddress" size="20">
				</td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="회원가입버튼"></td>
			</tr>
			</table>
		</form>
	</body>
</html>