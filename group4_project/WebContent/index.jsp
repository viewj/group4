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
		<h2>로그인 화면</h2>
		<form action="<%= request.getContextPath() %>/login/loginAction.jsp" method="post">
			<table border="1">
				<thead>
					<tr>
						<th>점심 메뉴 대신 골라드립니다.</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> 
							<div>&nbsp;아이디 : <input type="text" name="sendId"></div>
							<div>비밀번호 : <input type="text" name="sendPw"></div>
							<div><input type="submit" value="로그인"></div>
						</td>
					</tr>
					<tr>
						<td>
							<a href="<%= request.getContextPath() %>/member/memberInsert.jsp">회원가입</a> &nbsp;
							<a href="#">아이디/비밀번호 찾기</a>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<%
			} else {
		%>
			<%= memberName%>님 <%= memberLevel%>로 로그인중 
		<a href="<%= request.getContextPath() %>/login/logout.jsp"> 로그아웃 </a><br><br>
		<%
			if(memberLevel.equals("구매자")){
		%>
		<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01회원가입</a>
		<a href="<%= request.getContextPath() %>/goods/goods_search_form.jsp?m_id=<%= memberId%>">04상품검색</a>
		<%
			}else if(memberLevel.equals("판매자")){
		%>
		<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01회원가입</a>
		<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp?m_id=<%= memberId%>">03상품등록</a>
		<a href="<%= request.getContextPath() %>/goods/goods_search_form.jsp?m_id=<%= memberId%>">04상품검색</a>	
		<%
			}else if(memberLevel.equals("관리자")){
		%>	
		<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01회원가입</a>
		<a href="<%= request.getContextPath() %>/msearch/m_search_list.jsp">02전체회원검색</a>
		<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp?m_id=<%= memberId%>">03상품등록</a>
		<a href="<%= request.getContextPath() %>/goods/goods_search_form.jsp?m_id=<%= memberId%>">04상품검색</a>	
		<%
			}
		}
		%>
	</body>
</html>