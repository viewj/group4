<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.SellerDao" %>
<!-- 2018.07.05 28�� ������ -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>���� ó��</title>
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
			if(loginCheck.equals("�н����� ����")) {
		%>
				<script>
					alert("�н����尡 Ʋ���ϴ�");
					location.href = '<%=request.getContextPath()%>/goods/deleteGoods/goodsDeleteForm.jsp?sendCode=<%=sellCode%>';
				</script>
		<%
			}else {
		%>
				<script>
					alert("�Խù��� �����Ǿ����ϴ�");
					location.href = '<%=request.getContextPath()%>/goods/listGoods/goodsList.jsp';
				</script>
		<%		
			}
		%>
	</body>
</html>