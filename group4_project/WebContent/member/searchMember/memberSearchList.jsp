<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.MemberDao"%>
<%@ page import="group4_project.Member"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("EUC-KR");
		
			String memberId = (String)session.getAttribute("sendId");
			String memberName = (String)session.getAttribute("sendName");
			String memberLevel = (String)session.getAttribute("sendLevel");
			String memberGender = (String)session.getAttribute("sendGender");
			String memberAddress = (String)session.getAttribute("sendAddress");
			String memberDate = (String)session.getAttribute("sendDate");
			// 세션에서 받아온 아이디에 저장되어있는 정보들
			
			session.setAttribute("sendId", memberId);
			session.setAttribute("sendName", memberName);
			session.setAttribute("sendLevel", memberLevel);
			session.setAttribute("sendGender", memberGender);
			session.setAttribute("sendAddress", memberAddress);
			session.setAttribute("sendDate", memberDate);
			
			int currentPage = 1;
			if( request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			int rowPerPage = 5;
			int begin = (currentPage-1) * rowPerPage;
			
			MemberDao list = new MemberDao();
			ArrayList<Member> totalList = list.totalMemberList(begin ,rowPerPage);
		%>
		
		<%= memberName%>님 <%= memberLevel%>로 로그인 
		<a href="<%= request.getContextPath() %>/member/loginMember/logoutAction.jsp"> 로그아웃 </a><br><br>
		<h2>전체회원검색</h2>
		<form action="<%=request.getContextPath()%>/member/listMember/memberList.jsp" method="post">
			<span>
				<select name="searchList">
				    <option value="아이디" selected="selected">아이디</option>
				    <option value="이름" >이름</option>
				    <option value="권한" >권한</option>
				    <option value="성별" >성별</option>
				    <option value="주소" >주소</option>
				    <option value="가입날짜" >가입날짜</option>
				</select>
			</span>
			<span>
				<input type="text" name="searchText">
			</span>
			<span>
				<input type="submit" value="검색">
			</span> <br><br>
		</form>
		
		<form action="<%=request.getContextPath()%>/member/listMember/memberDetail.jsp" method="post">
			<table border="1">
				<thead>
					<tr>
						<th colspan="6">회원리스트</th>
					</tr>
					<tr>
						<th>아이디</th> <th>이름</th> <th>권한</th> <th>성별</th> <th>주소</th> <th>가입날짜</th>
					</tr>
				</thead>
				<tbody>	
					<%
						for(int i=0; i<totalList.size(); i++){
							Member member = totalList.get(i);
					%>		
							<tr>
								<td><a href="<%=request.getContextPath()%>/member/listMember/memberDetail.jsp?sendId=<%=member.getMemberId()%>"><%=member.getMemberId()%></a></td>
								<td><a href="<%=request.getContextPath()%>/member/listMember/memberDetail.jsp?sendId=<%=member.getMemberId()%>"><%=member.getMemberName()%></a></td>
								<td><a href="<%=request.getContextPath()%>/member/listMember/memberDetail.jsp?sendId=<%=member.getMemberId()%>"><%=member.getMemberLevel()%></a></td>
								<td><a href="<%=request.getContextPath()%>/member/listMember/memberDetail.jsp?sendId=<%=member.getMemberId()%>"><%=member.getMemberGender()%></a></td>
								<td><a href="<%=request.getContextPath()%>/member/listMember/memberDetail.jsp?sendId=<%=member.getMemberId()%>"><%=member.getMemberAddress()%></a></td>
								<td><a href="<%=request.getContextPath()%>/member/listMember/memberDetail.jsp?sendId=<%=member.getMemberId()%>"><%=member.getMemberDate()%></a></td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</form>
		<%
			int listPage = list.pagePerRow(rowPerPage);
			if(currentPage>1) {
		%>
				<a href="./memberSearchList.jsp?currentPage=<%=currentPage-1%>">◀ 이전</a>
		<%
			}
				//currentPage값이 1보다 크면 이전 a link태그가 나오는 if문 입니다.
			
			if(currentPage < listPage) {
		%>
				<a href="./memberSearchList.jsp?currentPage=<%=currentPage+1%>">다음 ▶</a>
		<%
			}
				//currentPage값이 listPage값보다 적으면 다음 페이지 a link태그가 나오는 if문 입니다.
		%>
	</body>
</html>