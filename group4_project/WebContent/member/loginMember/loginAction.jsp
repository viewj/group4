<!-- 18.07.04 28기 정규룡  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.MemberDao" %>
<%@ page import="group4_project.Member" %>
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
			
			String dbId = null;
			String dbPw = null;
			String dbLevel = null;
			String dbName = null;
			String dbGender = null;
			String dbAddress = null;
			String dbDate = null;
			
			Member m = new Member();
			MemberDao memberdao = new MemberDao();
			m = memberdao.loginMember(id, pw);
			
			if(id.equals(m.getMemberId())){
				dbId = m.getMemberId();
				dbPw = m.getMemberPw();
				/* System.out.println("아이디 일치"); */
				
				if(pw.equals(m.getMemberPw())){
					dbLevel = m.getMemberLevel();
					dbName = m.getMemberName();
					dbGender = m.getMemberGender();
					dbAddress = m.getMemberAddress();
					dbDate = m.getMemberDate();
					
					session.setAttribute("sendId", dbId);
					session.setAttribute("sendLevel", dbLevel);
					session.setAttribute("sendName", dbName);
					session.setAttribute("sendGender", dbGender);
					session.setAttribute("sendAddress", dbAddress);
					session.setAttribute("sendDate", dbAddress);
					/* System.out.println("로그인 성공"); */					
		%>	
				<script type="text/javascript">
					alert('로그인 성공');
					location.href ='<%=request.getContextPath()%>/index.jsp';
				</script>
		<%
				}else{
					System.out.println("비밀번호 불일치");
		%>
					<script type="text/javascript">
						alert('비밀번호 불일치');
						location.href ='<%=request.getContextPath()%>/index.jsp';
					</script>
		<%
				}
			}else{
				System.out.println("아이디 불일치");
		%>
			<script type="text/javascript">
			alert('아이디 불일치');
			location.href ='<%=request.getContextPath()%>/index.jsp';
			</script>
		<% 
			}	
		%>		
	</body>
</html>