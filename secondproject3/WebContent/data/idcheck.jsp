<%@page import="com.bit.model.UserDto"%>
<%@page import="com.bit.model.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	UserDao dao = new UserDao();
	out.print(dao.idCheck(request.getParameter("id")));
%>