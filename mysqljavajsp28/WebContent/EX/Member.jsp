<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dto.Member" %>

<%
Member m = new Member();
m.setM_id("id006");
m.setM_pw("pw006");
m.setM_level("������");
m.setM_name("4");
m.setM_email("5");

out.println(m.getM_id());
out.println(m.getM_pw());
out.println(m.getM_level());
out.println(m.getM_name());
out.println(m.getM_email());

%>
<!-- 
1�ܰ�)import
2�ܰ�)MemberŬ������ ����->����->�ּҰ� �Ҵ�
3�ܰ�)set�޼���� 5�� ȣ��
4�ܰ�)get�޽���� ȣ���ؼ� ȭ�鿡 ���
 -->