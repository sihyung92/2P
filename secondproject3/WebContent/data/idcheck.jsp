<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//i want to ajax die,,,need modify
	System.out.println("idcheckpage");
	String id = request.getParameter("id");
	out.println("{\"id\":"+id+"}");
%>