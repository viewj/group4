<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="connDB.DriverDB" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Index Page</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			String memberId = (String)session.getAttribute("sendId");
			String memberName = (String)session.getAttribute("sendName");
			String memberLevel = (String)session.getAttribute("sendLevel");
			
			if(memberLevel == null){ 
		%>
		<h2>�α��� ȭ��</h2>
		<form action="<%= request.getContextPath() %>/login/loginAction.jsp" method="post">
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
							<a href="<%= request.getContextPath() %>/member/memberInsert.jsp">ȸ������</a> &nbsp;
							<a href="#">���̵�/��й�ȣ ã��</a>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<%
			} else {
		%>
			<%= memberName%>�� <%= memberLevel%>�� �α����� 
		<a href="<%= request.getContextPath() %>/login/logout.jsp"> �α׾ƿ� </a><br><br>
		<%
			if(memberLevel.equals("������")){
		%>
		<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01ȸ������</a>
		<a href="<%= request.getContextPath() %>/goods/goods_search_form.jsp?m_id=<%= memberId%>">04��ǰ�˻�</a>
		<%
			}else if(memberLevel.equals("�Ǹ���")){
		%>
		<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01ȸ������</a>
		<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp?m_id=<%= memberId%>">03��ǰ���</a>
		<a href="<%= request.getContextPath() %>/goods/goods_search_form.jsp?m_id=<%= memberId%>">04��ǰ�˻�</a>	
		<%
			}else if(memberLevel.equals("������")){
		%>	
		<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01ȸ������</a>
		<a href="<%= request.getContextPath() %>/msearch/m_search_list.jsp">02��üȸ���˻�</a>
		<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp?m_id=<%= memberId%>">03��ǰ���</a>
		<a href="<%= request.getContextPath() %>/goods/goods_search_form.jsp?m_id=<%= memberId%>">04��ǰ�˻�</a>	
		<%
			}
		}
		%>
	</body>
</html>