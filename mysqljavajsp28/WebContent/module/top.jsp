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
		       ��ܸ޴�	<br><br>
<%if(S_LEVEL == null){ %>         
<!-- �α��� �� ȭ�� ���� -->		       	 
<form action="<%= request.getContextPath() %>/login/login_pro.jsp" method="post">
	���̵�: <input type="text" name="id">
	��  ��: <input type="password" name="pw">
	<input type="submit" value="�α��ι�ư">
</form>	<br>		   
<!-- �α��� �� ȭ�� End -->			       
		       
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01ȸ������</a>

<%
}else{
%>
	<%= S_NAME %>�� <%= S_LEVEL %> �� �α����� 
<a href="<%= request.getContextPath() %>/login/logout.jsp"> �α׾ƿ� </a><br><br>
<%
	if(S_LEVEL.equals("������")){
%>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01ȸ������</a>
<a href="#">04��ǰ�˻�</a>
<%
	}else if(S_LEVEL.equals("�Ǹ���")){
%>
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01ȸ������</a>
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">03��ǰ���</a>
<a href="#">04��ǰ�˻�</a>	
<%
	}else if(S_LEVEL.equals("������")){
%>	
<a href="<%= request.getContextPath() %>/minsert/m_insert_form.jsp">01ȸ������</a>
<a href="<%= request.getContextPath() %>/msearch/m_search_list.jsp">02��üȸ���˻�</a>
<a href="<%= request.getContextPath() %>/goods/goods_insert_form.jsp">03��ǰ���</a>
<a href="#">04��ǰ�˻�</a>	
<%
	}
}
%>

		   
			   
			   
		 </div>
		 <!-- End Header -->