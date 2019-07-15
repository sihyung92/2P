<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.model.AttendanceDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[
<%AttendanceDao dao = new AttendanceDao();
	int lecNum=Integer.parseInt(request.getParameter("lecNum"));
	ArrayList<String> list = dao.getList(lecNum);
	for(int i = 0 ; i < list.size(); i++){
		out.print("{\"data\" : \""+list.get(i)+"\"}");
		if(i!=list.size()-1){
			out.print(",");
		}
	}
%>
]