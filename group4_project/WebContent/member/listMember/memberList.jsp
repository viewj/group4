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
			String memberAddress = (String)session.getAttribute("sendAddress");
			String memberDate = (String)session.getAttribute("sendDate");
			// ���ǿ��� �޾ƿ� ���̵� ����Ǿ��ִ� ������
			
			session.setAttribute("sendId", memberId);
			session.setAttribute("sendName", memberName);
			session.setAttribute("sendLevel", memberLevel);
			session.setAttribute("sendGender", memberGender);
			session.setAttribute("sendAddress1", memberAddress);
			session.setAttribute("sendDate", memberDate);
			
			MemberDao list = new MemberDao();
			ArrayList<Member> totalList = list.totalMemberList();
		%>
		
		<%= memberName%>�� <%= memberLevel%>�� �α��� 
		<a href="<%= request.getContextPath() %>/member/loginMember/logoutAction.jsp"> �α׾ƿ� </a><br><br>
		<h2>��üȸ���˻�</h2>
		<table border="1">
			<thead>
				<tr>
					<th colspan="6">ȸ������Ʈ</th>
				</tr>
				<tr>
					<th>���̵�</th> <th>�̸�</th> <th>����</th> <th>����</th> <th>�ּ�</th> <th>���Գ�¥</th>
				</tr>
			</thead>
			<tbody>	
		<%
			for(int i=0; i<totalList.size(); i++){
				Member member = totalList.get(i);
		%>		
				<tr>
					<td><%=member.getMemberId()%></td>
					<td><%=member.getMemberName()%></td>
					<td><%=member.getMemberLevel()%></td>
					<td><%=member.getMemberGender()%></td>
					<td><%=member.getMemberAddress()%></td>
					<td><%=member.getMemberDate()%></td>
				</tr>
		<%
			}
		%>
			</tbody>
		</table>	
	</body>
</html>