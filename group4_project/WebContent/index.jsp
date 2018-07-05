<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Index Page</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			// �ѱ� ��밡���ϰ� ��
			String memberId = (String)session.getAttribute("sendId");
			String memberName = (String)session.getAttribute("sendName");
			String memberLevel = (String)session.getAttribute("sendLevel");
			String memberGender = (String)session.getAttribute("sendGender");
			String memberAddress1 = (String)session.getAttribute("sendAddress1");
			String memberAddress2 = (String)session.getAttribute("sendAddress2");
			String memberDate = (String)session.getAttribute("sendDate");
			// ���ǿ��� �޾ƿ� ���̵� ����Ǿ��ִ� ������
			
			session.setAttribute("sendId", memberId);
			session.setAttribute("sendName", memberName);
			session.setAttribute("sendLevel", memberLevel);
			session.setAttribute("sendGender", memberGender);
			session.setAttribute("sendAddress1", memberAddress1);
			session.setAttribute("sendAddress2", memberAddress2);
			session.setAttribute("sendDate", memberDate);
			
		// ���Ѻ��� �����Ǵ� ȭ���� �޶���
			if(memberLevel == null){ 
			// ��α��� ȭ��
		%>
		<h2>�α��� ȭ��</h2>
		<form action="<%= request.getContextPath() %>/member/loginMember/loginAction.jsp" method="post">
			<table border="1">
				<thead>
					<tr>
						<th>���� �޴� ��� ���帳�ϴ�.</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> 
							<div>&nbsp;���̵� : <input type="text" name="sendId"></div>
							<div>��й�ȣ : <input type="text" name="sendPw"></div>
							<div><input type="submit" value="�α���"></div>
						</td>
					</tr>
					<tr>
						<td>
							<a href="<%= request.getContextPath() %>/member/insertMember/memberInsertForm.jsp">ȸ������</a> &nbsp;
							<a href="#">���̵�/��й�ȣ ã��</a>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<%
			} else {
			// �α��� ���� �� ȭ��
		%>
			<%= memberName%>�� <%= memberLevel%>�� �α��� 
		<a href="<%= request.getContextPath() %>/member/loginMember/logoutAction.jsp"> �α׾ƿ� </a><br><br>
		<%
			if(memberLevel.equals("������")){
		%>
		<a href="<%= request.getContextPath() %>/member/insertMember/memberInsertForm.jsp">01ȸ������</a>
		<a href="#">02ȸ����������</a>
		<a href="#">03��ǰ�˻�</a>
		<h2>����ȭ��</h2>
		<table border="1">
			<thead>
				<tr>
					<th>���� ���� ����Ʈ</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> </td>
				</tr>
			</tbody>
		</table>
		<%
			}else if(memberLevel.equals("�Ǹ���")){
		%>
		<a href="<%= request.getContextPath() %>/member/insertMember/memberInsertForm.jsp">01ȸ������</a>
		<a href="#">02ȸ����������</a>
		<a href="#">03��ǰ���</a>
		<a href="#">04��ü��ǰ�˻�</a>
		<h2>����ȭ��</h2>
		<table border="1">
			<thead>
				<tr>
					<th>���� ���� ����Ʈ</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> </td>
				</tr>
			</tbody>
		</table>
		<%
			}else if(memberLevel.equals("������")){
		%>	
		<a href="<%= request.getContextPath() %>/member/insertMember/memberInsertForm.jsp">01ȸ������</a>
		<a href="<%= request.getContextPath() %>/member/mList/memberList">02��üȸ���˻�</a>
		<a href="<%= request.getContextPath() %>/member/updateMember/memberUpdateForm.jsp">03ȸ����������</a>
		<a href="#">04��ǰ���</a>
		<a href="#">05��ü��ǰ�˻�</a>
		<h2>����ȭ��</h2>
		<table border="1">
			<thead>
				<tr>
					<th>���� ���� ����Ʈ</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> </td>
				</tr>
			</tbody>
		</table>
		<%
			}
		}
		%>
	</body>
</html>