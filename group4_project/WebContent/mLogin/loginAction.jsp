<!-- 18.07.04 28�� ���Է�  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.Mlogin" %>
<%@ page import = "java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>LoginAction Page</title>
	</head>
	<body>
		<%
			String id = request.getParameter("sendId");	
			String pw = request.getParameter("sendPw");
			
			ResultSet rs = null;
			String dbId = null;
			String dbPw = null;
			String dbLevel = null;
			String dbName = null;
			String dbGender = null;
			String dbAddr = null;
			String dbDate = null;
			
			Mlogin resultset = new Mlogin();
			rs = resultset.mLogin(id, pw);
			
			if(rs.next()){
				
				dbId = rs.getString("member_id");
				dbPw = rs.getString("member_pw");
				dbLevel = rs.getString("member_level");
				dbName = rs.getString("member_name");
				dbGender = rs.getString("member_gender");
				dbAddr = rs.getString("member_address");
				dbDate = rs.getString("member_date");
				/* System.out.println("���̵� ��ġ"); */
				
				if(pw.equals(dbPw)){
					
					session.setAttribute("sendLevel", dbLevel);
					session.setAttribute("sendName", dbName);
					session.setAttribute("sendId", dbId);
					session.setAttribute("sendGender", dbGender);
					session.setAttribute("sendAddr", dbAddr);
					session.setAttribute("sendDate", dbDate);
					/* System.out.println("�α��� ����"); */
		%>	
					<script type="text/javascript">
						alert('�α��� ����');
						location.href ='<%=request.getContextPath()%>/index.jsp';
					</script>
		<%
				}else{
					System.out.println("��й�ȣ ����ġ");
		%>
					<script type="text/javascript">
						alert('��й�ȣ ����ġ');
						location.href ='<%=request.getContextPath()%>/index.jsp';
					</script>
		<%
					}
			}else {
				System.out.println("���̵� ����ġ");
		%>
				<script type="text/javascript">
				alert('���̵� ����ġ');
				location.href ='<%=request.getContextPath()%>/index.jsp';
				</script>
		<% 
				}
		%>	
	</body>
</html>