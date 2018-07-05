<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="group4_project.SellerDao"%>
<%@ page import="group4_project.Seller"%>
<!-- 2018.07.04 28�� ������ -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>���� �޴���ǰ ����Ʈ</title>
	</head>
	<body>
		<%
			String memberId =(String)session.getAttribute("sendId");
			int currentPage = 1;
			//���� �������� �����߽��ϴ�.
			if( request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			//currentPage������ ���� ��������� ���������� ��ȯ�� ��������ϴ�.
			int rowPerPage = 5;
			//�� �������� ���� ������ ���� ���� �Դϴ�.
			int begin = (currentPage-1) * rowPerPage;
			SellerDao sellerDao = new SellerDao();
			ArrayList<Seller> getTotalList = sellerDao.listSellerSelect(begin ,rowPerPage);
		%>
		<h2>���� �޴�</h2>
		<input type="button" onclick="location.href='<%=request.getContextPath()%>/goods/insertGoods/goodsInsertForm.jsp?sendId=<%=memberId%>'" value="��ǰ ����ϱ�">
		<table border="1">
			<tr>
				<td>�����̸�</td>
				<td>���� �޴� </td>
				<td>�޴� ���� </td>
				<td>���� �ּ� </td>
			</tr>
		<%
			for(int i=0; i<getTotalList.size(); i++) {
			//int ������ i���� getTotalList������ ����ִ� indexũ�⺸�� ���������� �ݺ��ϰ� �ϴ� for�� �Դϴ�.
				Seller seller = getTotalList.get(i);
				//for���� ������ �Ǹ� getTotalList������ �ִ� index���� ������ seller������ �Ҵ��մϴ�. 
				
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
				<a href="./goodsList.jsp?currentPage=<%=currentPage-1%>">�� ����</a>
		<%
			}
			//currentPage���� 1���� ũ�� ���� a link�±װ� ������ if�� �Դϴ�.
			
			if(currentPage<listPage) {
		%>
				<a href="./goodsList.jsp?currentPage=<%=currentPage+1%>">���� ��</a>
		<%
			}
			//currentPage���� listPage������ ������ ���� ������ a link�±װ� ������ if�� �Դϴ�.
		%>
	</body>
</html>