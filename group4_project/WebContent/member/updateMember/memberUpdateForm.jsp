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
		<h2>ȸ����������ȭ��</h2>
		<form action="<%= request.getContextPath() %>/member/updateMember/memberUpdateAction.jsp" method="post">
			<table border="1">
			<tr>
				<td>���̵�</td>
				<td><input type="text" name="memberId" size="20" value="<%=member.getMemberId()%>" readonly></td>
			</tr>
			<tr>
				<td>��ȣ</td>
				<td><input type="password" name="memberPw" size="20"></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><input type="text" name="memberName" size="20" value="<%=member.getMemberName()%>"></td>
			</tr>
			<tr>
				<td>����</td>
				<%
					if((member.getMemberLevel()).equals("������")) {
				%>
					<td>
						<select name="memberLevel">
						    <option value="������">������</option>
						    <option value="�Ǹ���">�Ǹ���</option>
						    <option value="������" selected="selected">������</option>
						</select>
					</td>
				<%
					} else if ((member.getMemberLevel()).equals("�Ǹ���")) {
						
				%>
					<td>
						<select name="memberLevel">
						    <option value="������">������</option>
						    <option value="�Ǹ���" selected="selected">�Ǹ���</option>
						    <option value="������">������</option>
						</select>
					</td>
				<%
					} else {
				%>
					<td>
						<select name="memberLevel">
						    <option value="������" selected="selected">������</option>
						    <option value="�Ǹ���">�Ǹ���</option>
						    <option value="������">������</option>
						</select>
					</td>
				<%
					}
				%>
			</tr>
			<%
				if ((member.getMemberGender().equals("����")	)) {
			%>
				<tr>
					<td>����</td>
					<td>
						<select name="memberGender">
						    <option value="����" selected="selected">����</option>
						    <option value="����" >����</option>
						</select>
					</td>
				</tr>
			<%
				} else {
			%>
					<tr>
						<td>����</td>
						<td>
							<select name="memberGender">
							    <option value="����">����</option>
							    <option value="����" selected="selected">����</option>
							</select>
						</td>
					</tr>
			<%
				}
			%>
			
			<tr>
				<td>�ּ�</td>
				<td>
					<input type="text" name="memberAddress" size="20" value="<%=memberAddress%>">
				</td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="�����Ϸ��ư"></td>
			</tr>
			</table>
		</form>
	</body>
</html>