<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
         <!-- Begin Header -->
         <div id="header">
<%
String S_ID = (String)session.getAttribute("S_ID");
String S_NAME = (String)session.getAttribute("S_NAME");
String S_LEVEL = (String)session.getAttribute("S_LEVEL");
System.out.println(S_ID + "<-- S_ID");
System.out.println(S_NAME + "<-- S_NAME");
System.out.println(S_LEVEL + "<-- S_LEVEL");

%>
top.jsp		<br>		 
		       상단메뉴	<br><br>
<%if(S_LEVEL == null){ %>         
<!-- 로그인 전 화면 시작 -->		       	 
<form action="<%= request.getContextPath() %>/login/login_pro.jsp" method="post">
	아이디: <input type="text" name="id">
	비  번: <input type="password" name="pw">
	<input type="submit" value="로그인버튼">
</form>	<br>		   
<!-- 로그인 전 화면 End -->			       
		       
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01회원가입</a>

<%
}else{
%>
	<%= S_NAME %>님 <%= S_LEVEL %> 로 로그인중 
<a href="<%= request.getContextPath() %>/login/logout.jsp"> 로그아웃 </a><br><br>
<%
	if(S_LEVEL.equals("구매자")){
%>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01회원가입</a>
<a href="#">04상품검색</a>
<%
	}else if(S_LEVEL.equals("판매자")){
%>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01회원가입</a>
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">03상품등록</a>
<a href="#">04상품검색</a>	
<%
	}else if(S_LEVEL.equals("관리자")){
%>	
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01회원가입</a>
<a href="<%= request.getContextPath() %>/msearch/m_search_list.jsp">02전체회원검색</a>
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">03상품등록</a>
<a href="#">04상품검색</a>	
<%
	}
}
%>

		   
			   
			   
		 </div>
		 <!-- End Header -->