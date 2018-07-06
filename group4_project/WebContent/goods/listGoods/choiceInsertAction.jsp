<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.Choice"%>
<%@ page import="group4_project.ChoiceDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	 <%
	 		request.setCharacterEncoding("euc-kr");
			int sellCode = Integer.parseInt(request.getParameter("sendCheckList"));
			String memberId = (String)session.getAttribute("sendId");
			System.out.println(sellCode +"<-sellCode");
			System.out.println(memberId +"<- memberId");
			ChoiceDao choicedao = new ChoiceDao();
			choicedao.insertChoice(memberId, sellCode);
			
			response.sendRedirect("request.getContextPath()/.goodsList.jsp");
	%>
	</body>
</html>