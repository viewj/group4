<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="group4_project.SellerDao"%>
<%@ page import="group4_project.Seller" %>
<%@ page import="java.util.ArrayList"%>
<!-- 2018.07.05 28�� ������ -->
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�˻� ���� ȭ��</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
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
		
			String getTitle = request.getParameter("title");
			String getSellSearch = request.getParameter("sellSearch");
			System.out.println(currentPage + rowPerPage + getTitle + getSellSearch + "<---goodSearchList������");
			SellerDao sellerDao = new SellerDao();
			ArrayList<Seller> searchList = sellerDao.SelectSearchList(getTitle ,getSellSearch ,begin ,rowPerPage);
		%>
			<h2>���� �޴�</h2>
				<form action="<%=request.getContextPath()%>/goods/searchGoods/goodsSearchList.jsp" method="post">
				<table>
					<tr>
						<td>�˻��ϱ� :</td>
						<td><select name="title">
							<option>�����̸�</option>
							<option>�����̸�</option>
							<option>�ּ�</option>
							
						</select></td>
						<td><input type="text" name="sellSearch"></td>
						<td><input type="submit" value="�˻�"></td>
					</tr>
					</table>
				</form>	
			<span>
				<input type="button" onclick="location.href='<%=request.getContextPath()%>/goods/insertGoods/goodsInsertForm.jsp?sendId=<%=memberId%>'" value="��ǰ ����ϱ�">
			</span>
			<!-- ��ǰ ����ϴ°����� ���� ��ư�Դϴ� -->
			<span>
				<input type="button" onclick="location.href='<%=request.getContextPath()%>/index.jsp'" value="����Ȩ��������">
			</span>
			<!-- ����Ȩ�������� ���� ��ư�Դϴ�. -->
			<table border="1">
				<tr>
					<td>�����̸�</td>
					<td>���� �޴� </td>
					<td>�޴� ���� </td>
					<td>���� �ּ� </td>
					<td>����</td>
				</tr>
		<%
				for(int i=0; i<searchList.size(); i++) {
				//int ������ i���� getTotalList������ ����ִ� indexũ�⺸�� ���������� �ݺ��ϰ� �ϴ� for�� �Դϴ�.
					Seller seller = searchList.get(i);
					//for���� ������ �Ǹ� getTotalList������ �ִ� index���� ������ seller������ �Ҵ��մϴ�. 
					
		%>
				<tr>
					<td><a href="./goodsDetail.jsp?sendCode=<%=seller.getSellCode()%>"><%=seller.getSellName()%></a></td>
					<td><%=seller.getSellMenu()%></td>
					<td><%=seller.getSellPrice()%></td>
					<td><%=seller.getSellAddress()%></td>
					<td><input type="checkbox" name="checkList" value="<%=seller.getSellMenu()%>"></td>
				</tr>
		
		<%
				}		
		%>
			</table>
		<%
				int listPage = sellerDao.SearchpagePerRow(rowPerPage);
				if(currentPage>1) {
		%>
					<a href="./goodsSearchList.jsp.jsp?currentPage=<%=currentPage-1%>">�� ����</a>
		<%
				}
				//currentPage���� 1���� ũ�� ���� a link�±װ� ������ if�� �Դϴ�.
				
				if(currentPage<listPage) {
		%>
					<a href="./goodsSearchList.jsp.jsp?currentPage=<%=currentPage+1%>">���� ��</a>
		<%
				}
				//currentPage���� listPage������ ������ ���� ������ a link�±װ� ������ if�� �Դϴ�.
		%>
	</body>
</html>