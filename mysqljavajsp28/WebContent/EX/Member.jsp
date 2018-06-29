<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dto.Member" %>

<%
Member m = new Member();
m.setM_id("id006");
m.setM_pw("pw006");
m.setM_level("구매자");
m.setM_name("4");
m.setM_email("5");

out.println(m.getM_id());
out.println(m.getM_pw());
out.println(m.getM_level());
out.println(m.getM_name());
out.println(m.getM_email());

%>
<!-- 
1단계)import
2단계)Member클래스로 선언->생성->주소값 할당
3단계)set메서드들 5개 호출
4단계)get메스드들 호출해서 화면에 출력
 -->