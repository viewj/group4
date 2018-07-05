<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="group4_project.SellerDao"%>
<%@ page import="group4_project.Seller"%>
<!-- 2018.07.04 28기 전재현 -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>음식 메뉴상품 리스트</title>
	</head>
	<body>
		<%
			String memberId =(String)session.getAttribute("sendId");
			int currentPage = 1;
			//현재 페이지를 설정했습니다.
			if( request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			//currentPage변수에 값이 들어있으면 정수형으로 변환을 시켜줬습니다.
			int rowPerPage = 5;
			//한 페이지에 나올 값들의 갯수 설정 입니다.
			int begin = (currentPage-1) * rowPerPage;
			SellerDao sellerDao = new SellerDao();
			ArrayList<Seller> getTotalList = sellerDao.listSellerSelect(begin ,rowPerPage);
		%>
		<h2>음식 메뉴</h2>
		<input type="button" onclick="location.href='<%=request.getContextPath()%>/goods/insertGoods/goodsInsertForm.jsp?sendId=<%=memberId%>'" value="상품 등록하기">
		<table border="1">
			<tr>
				<td>가게이름</td>
				<td>음식 메뉴 </td>
				<td>메뉴 가격 </td>
				<td>가게 주소 </td>
			</tr>
		<%
			for(int i=0; i<getTotalList.size(); i++) {
			//int 형식의 i값이 getTotalList변수에 들어있는 index크기보다 작은값까지 반복하게 하는 for문 입니다.
				Seller seller = getTotalList.get(i);
				//for문이 실행이 되면 getTotalList변수에 있는 index값을 가져와 seller변수에 할당합니다. 
				
		%>
			<tr>
				<td><a href="./goodsDetail.jsp?sendCode=<%=seller.getSellCode()%>"><%=seller.getSellName()%></a></td>
				<td><%=seller.getSellMenu()%></td>
				<td><%=seller.getSellPrice()%></td>
				<td><%=seller.getSellAddress()%></td>
			</tr>
	
		<%
			}		
		%>
		</table>
		<%
			int listPage = sellerDao.pagePerRow(rowPerPage);
			if(currentPage>1) {
		%>
				<a href="./goodsList.jsp?currentPage=<%=currentPage-1%>">◀ 이전</a>
		<%
			}
			//currentPage값이 1보다 크면 이전 a link태그가 나오는 if문 입니다.
			
			if(currentPage<listPage) {
		%>
				<a href="./goodsList.jsp?currentPage=<%=currentPage+1%>">다음 ▶</a>
		<%
			}
			//currentPage값이 listPage값보다 적으면 다음 페이지 a link태그가 나오는 if문 입니다.
		%>
	</body>
</html>