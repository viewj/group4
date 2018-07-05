<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!-- 2018.07.05 28기 전재현 -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>삭제 처리 화면</title>
	</head>
	<body>
		<%
			int sellCode = Integer.parseInt(request.getParameter("sendCode"));
			String memberId = (String)session.getAttribute("sendId");
		%>
		<h2>게시물 삭제 하기</h2>
		<form action="./goodsDeleteAction.jsp" method="post">
			<table>
				<tr>
					<td>패스워드를 입력하세요 :</td>
					<td><input type="password" name="memberPassword"></td>
				</tr>
				<tr>
					<td><input type="button" name="forback" value="되돌아가기" onclick="location.href='<%=request.getContextPath()%>/goods/listGoods/goodsDetail.jsp'"></td>
					<td><input type="submit" value="삭제하기"></td>
					<td><input type="hidden" name="sendCode" value="<%=sellCode%>"></td>
					<td><input type="hidden" name="sendId" value="<%=memberId%>"></td>
				</tr>
			</table>	
		</form>
	</body>
</html>