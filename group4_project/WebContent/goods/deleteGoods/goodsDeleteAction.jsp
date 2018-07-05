<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.SellerDao" %>
<!-- 2018.07.05 28기 전재현 -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>삭제 처리</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euckr");	
		
			int sellCode = Integer.parseInt(request.getParameter("sendCode"));
			String memberId = request.getParameter("sendId");
			String memberPass = request.getParameter("memberPassword");
			System.out.println(sellCode +"<- sellCode");
			System.out.println(memberId +"<- memberId");
			System.out.println(memberPass +"<- pass");
			SellerDao sellerDao = new SellerDao();
			
			String loginCheck = sellerDao.deleteSellerSelect(memberId ,memberPass ,sellCode);
			System.out.println(loginCheck +"<- loginCheck");
			if(loginCheck.equals("패스워드 실패")) {
		%>
				<script>
					alert("패스워드가 틀립니다");
					location.href = '<%=request.getContextPath()%>/goods/deleteGoods/goodsDeleteForm.jsp?sendCode=<%=sellCode%>';
				</script>
		<%
			}else {
		%>
				<script>
					alert("게시물이 삭제되었습니다");
					location.href = '<%=request.getContextPath()%>/goods/listGoods/goodsList.jsp';
				</script>
		<%		
			}
		%>
	</body>
</html>