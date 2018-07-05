<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.MemberDao"%>
<%@ page import="group4_project.Member"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberUpdateForm Page</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("EUC-KR");
			
			String memberId = (String)session.getAttribute("sendId");
			String memberName = (String)session.getAttribute("sendName");
			String memberLevel = (String)session.getAttribute("sendLevel");
			String memberGender = (String)session.getAttribute("sendGender");
			String memberAddress = (String)session.getAttribute("sendAddress");
			String memberDate = (String)session.getAttribute("sendDate");
			
			session.setAttribute("sendId", memberId);
			session.setAttribute("sendName", memberName);
			session.setAttribute("sendLevel", memberLevel);
			session.setAttribute("sendGender", memberGender);
			session.setAttribute("sendAddress1", memberAddress);
			session.setAttribute("sendDate", memberDate);
		
			Member member = new Member();
			MemberDao memberdao = new MemberDao();
			member = memberdao.selectMember(memberId);
		%>
		<h2>회원정보수정화면</h2>
		<form action="<%= request.getContextPath() %>/member/updateMember/memberUpdateAction.jsp" method="post">
			<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberId" size="20" value="<%=member.getMemberId()%>" readonly></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="memberPw" size="20"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="memberName" size="20" value="<%=member.getMemberName()%>"></td>
			</tr>
			<tr>
				<td>권한</td>
				<%
					if((member.getMemberLevel()).equals("구매자")) {
				%>
					<td>
						<select name="memberLevel">
						    <option value="관리자">관리자</option>
						    <option value="판매자">판매자</option>
						    <option value="구매자" selected="selected">구매자</option>
						</select>
					</td>
				<%
					} else if ((member.getMemberLevel()).equals("판매자")) {
						
				%>
					<td>
						<select name="memberLevel">
						    <option value="관리자">관리자</option>
						    <option value="판매자" selected="selected">판매자</option>
						    <option value="구매자">구매자</option>
						</select>
					</td>
				<%
					} else {
				%>
					<td>
						<select name="memberLevel">
						    <option value="관리자" selected="selected">관리자</option>
						    <option value="판매자">판매자</option>
						    <option value="구매자">구매자</option>
						</select>
					</td>
				<%
					}
				%>
			</tr>
			<%
				if ((member.getMemberGender().equals("남자")	)) {
			%>
				<tr>
					<td>성별</td>
					<td>
						<select name="memberGender">
						    <option value="남자" selected="selected">남자</option>
						    <option value="여자" >여자</option>
						</select>
					</td>
				</tr>
			<%
				} else {
			%>
					<tr>
						<td>성별</td>
						<td>
							<select name="memberGender">
							    <option value="남자">남자</option>
							    <option value="여자" selected="selected">여자</option>
							</select>
						</td>
					</tr>
			<%
				}
			%>
			
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="memberAddress" size="20" value="<%=memberAddress%>">
				</td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="수정완료버튼"></td>
			</tr>
			</table>
		</form>
	</body>
</html>