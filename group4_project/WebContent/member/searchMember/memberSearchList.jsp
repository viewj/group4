<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.MemberDao"%>
<%@ page import="group4_project.Member"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("EUC-KR");
		
			String memberId = (String)session.getAttribute("sendId");
			String memberName = (String)session.getAttribute("sendName");
			String memberLevel = (String)session.getAttribute("sendLevel");
			String memberGender = (String)session.getAttribute("sendGender");
			String memberAddress1 = (String)session.getAttribute("sendAddress1");
			String memberAddress2 = (String)session.getAttribute("sendAddress2");
			String memberDate = (String)session.getAttribute("sendDate");
			// 세션에서 받아온 아이디에 저장되어있는 정보들
			
			session.setAttribute("sendId", memberId);
			session.setAttribute("sendName", memberName);
			session.setAttribute("sendLevel", memberLevel);
			session.setAttribute("sendGender", memberGender);
			session.setAttribute("sendAddress1", memberAddress1);
			session.setAttribute("sendAddress2", memberAddress2);
			session.setAttribute("sendDate", memberDate);
			
			MemberDao list = new MemberDao();
			ArrayList<Member> totalList = list.totalMemberList();
		%>
		
		<%= memberName%>님 <%= memberLevel%>로 로그인 
		<a href="<%= request.getContextPath() %>/member/loginMember/logoutAction.jsp"> 로그아웃 </a><br><br>
		<h2>전체회원검색</h2>
		<table border="1">
			<thead>
				<tr>
					<th>회원리스트</th>
				</tr>
			</thead>
			<tbody>	
		<%
			for(int i=0; i<totalList.size(); i++){
				Member member = totalList.get(i);
		%>		
				<tr>
					<td><%=member.getMemberId()%></td>
					<td><%=member.getMemberName()%>
				</tr>
		<%
			}
		%>
			</tbody>
		</table>	
	</body>
</html>