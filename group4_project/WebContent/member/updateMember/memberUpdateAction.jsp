<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.Member"%>
<%@ page import="group4_project.MemberDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberUpdateAction Page</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("EUC-KR");
			Member member = new Member();
			MemberDao memberdao = new MemberDao();
			
			String memberId = request.getParameter("memberId");
			String memberPw = request.getParameter("memberPw");
			String memberName = request.getParameter("memberName");
			String memberLevel = request.getParameter("memberLevel");
			String memberGender = request.getParameter("memberGender");
			String memberAddress = request.getParameter("memberAddress");
			
			member.setMemberId(memberId);
			member.setMemberPw(memberPw);
			member.setMemberName(memberName);
			member.setMemberLevel(memberLevel);
			member.setMemberGender(memberGender);
			member.setMemberAddress(memberAddress);
			
			memberdao.updateMember(member);
			
			response.sendRedirect(request.getContextPath() + "/member/memberList/memberList.jsp");
		%>
	</body>
</html>