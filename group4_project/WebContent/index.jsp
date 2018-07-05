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
			// 한글 사용가능하게 함
			String memberId = (String)session.getAttribute("sendId");
			String memberName = (String)session.getAttribute("sendName");
			String memberLevel = (String)session.getAttribute("sendLevel");
			String memberGender = (String)session.getAttribute("sendGender");
			String memberAddress1 = (String)session.getAttribute("sendAddress1");
			String memberAddress2 = (String)session.getAttribute("sendAddress2");
			String memberDate = (String)session.getAttribute("sendDate");
			// 세션에서 받아온 아이디에 저장되어있는 정보들
			
			session.setAttribute("sendId", memberId);
			session.setAttribute("sendName", memberName);
			session.setAttribute("sendLevel", memberLevel);
			session.setAttribute("sendGender", memberGender);
			session.setAttribute("sendAddress1", memberAddress1);
			session.setAttribute("sendAddress2", memberAddress2);
			session.setAttribute("sendDate", memberDate);
			
		// 권한별로 구현되는 화면이 달라짐
			if(memberLevel == null){ 
			// 비로그인 화면
		%>
		<h2>로그인 화면</h2>
		<form action="<%= request.getContextPath() %>/member/loginMember/loginAction.jsp" method="post">
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
							<a href="<%= request.getContextPath() %>/member/insertMember/memberInsertForm.jsp">회원가입</a> &nbsp;
							<a href="#">아이디/비밀번호 찾기</a>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<%
			} else {
			// 로그인 성공 시 화면
		%>
			<%= memberName%>님 <%= memberLevel%>로 로그인 
		<a href="<%= request.getContextPath() %>/member/loginMember/logoutAction.jsp"> 로그아웃 </a><br><br>
		<%
			if(memberLevel.equals("구매자")){
		%>
		<a href="<%= request.getContextPath() %>/member/insertMember/memberInsertForm.jsp">01회원가입</a>
		<a href="#">02회원정보수정</a>
		<a href="#">03상품검색</a>
		<h2>선택화면</h2>
		<table border="1">
			<thead>
				<tr>
					<th>나의 점심 리스트</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> </td>
				</tr>
			</tbody>
		</table>
		<%
			}else if(memberLevel.equals("판매자")){
		%>
		<a href="<%= request.getContextPath() %>/member/insertMember/memberInsertForm.jsp">01회원가입</a>
		<a href="#">02회원정보수정</a>
		<a href="#">03상품등록</a>
		<a href="#">04전체상품검색</a>
		<h2>선택화면</h2>
		<table border="1">
			<thead>
				<tr>
					<th>나의 점심 리스트</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> </td>
				</tr>
			</tbody>
		</table>
		<%
			}else if(memberLevel.equals("관리자")){
		%>	
		<a href="<%= request.getContextPath() %>/member/insertMember/memberInsertForm.jsp">01회원가입</a>
		<a href="<%= request.getContextPath() %>/member/mList/memberList">02전체회원검색</a>
		<a href="<%= request.getContextPath() %>/member/updateMember/memberUpdateForm.jsp">03회원정보수정</a>
		<a href="#">04상품등록</a>
		<a href="#">05전체상품검색</a>
		<h2>선택화면</h2>
		<table border="1">
			<thead>
				<tr>
					<th>나의 점심 리스트</th>
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