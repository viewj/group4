<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dao.Mdao" %>
<%@ page import = "kr.or.ksmart.dto.Member" %>
<%@ page import = "java.util.ArrayList" %>

<%
Mdao dao = new Mdao();
ArrayList<Member> get_alm = dao.mAllSelect();
for(int i=0;i<get_alm.size();i++){
	Member m = get_alm.get(i);
	String get_m_id = m.getM_id();
	String get_m_pw = m.getM_pw();
	String get_m_level = m.getM_level();
	String get_m_name = m.getM_name();
	String get_m_email = m.getM_email();
	
	out.println(get_m_id + "<-- get_m_id <br>");
	out.println(get_m_pw + "<-- get_m_pw <br>");
	out.println(get_m_level + "<-- get_m_level <br>");
	out.println(get_m_name + "<-- get_m_name <br>");
	out.println(get_m_email + "<-- get_m_email <br><br>");
}

%>



