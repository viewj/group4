<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.Member"%>
<%@ page import="group4_project.MemberDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberDetail Page</title>
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
			session.setAttribute("sendAddress", memberAddress);
			session.setAttribute("sendDate", memberDate);
			
			String getId = request.getParameter("sendId");
			Member member = new Member();
			MemberDao memberdao = new MemberDao();
			
			member = memberdao.selectMember(getId);
			
		%>
		<h2>ȸ�� �� ����</h2>
		<table>
			<tr>
				<td>�ƾƵ� :</td>
				<td><%=member.getMemberId()%></td>
			</tr>
			<tr>
				<td>�̸� :</td>
				<td><%=member.getMemberName()%></td>
			</tr>
			<tr>
				<td>���� :</td>
				<td><%=member.getMemberLevel()%></td>
			</tr>
			<tr>
				<td>���� :</td>
				<td><%=member.getMemberGender()%></td>
			</tr>
			<tr>
				<td>�ּ� :</td>
				<td><%=member.getMemberAddress()%></td>
			</tr>
			<tr>
				<td>���Գ�¥ :</td>
				<td><%=member.getMemberDate()%></td>
			</tr>
			<tr>
				<td><a href="<%= request.getContextPath() %>/member/updateMember/memberUpdateForm.jsp">����</a></td>
				<td><a href="<%= request.getContextPath() %>/member/deleteMember/memberDeleteForm.jsp">����</a></td>
			</tr>
			
		</table>
	</body>
</html>