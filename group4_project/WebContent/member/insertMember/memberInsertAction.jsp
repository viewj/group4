<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.MemberDao" %>
<%@ page import="group4_project.Member" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("EUC-KR");
			
			String memberId = request.getParameter("memberId");
			String memberPw = request.getParameter("memberPw");
			String memberName = request.getParameter("memberName");
			String memberLevel = request.getParameter("memberLevel");
			String memberGender = request.getParameter("memberGender");
			String memberAddress = request.getParameter("memberAddress");
			
								
			Member member = new Member();
			member.setMemberId(memberId);
			member.setMemberPw(memberPw);
			member.setMemberName(memberName);
			member.setMemberLevel(memberLevel);
			member.setMemberGender(memberGender);
			member.setMemberAddress(memberAddress);
			
			MemberDao memberdao = new MemberDao();
			memberdao.insertMember(member);
			
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		%>
	</body>
</html>