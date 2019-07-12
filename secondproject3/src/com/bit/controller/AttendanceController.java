package com.bit.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.ClassDao;
import com.bit.model.ClassDto;
import com.bit.model.UserDao;
import com.bit.model.UserDto;
@WebServlet("/lms/attendance.bit")
public class AttendanceController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int lecNum = Integer.parseInt(req.getParameter("lecNum"));
		ClassDao classDao = new ClassDao();
		ClassDto classBean = classDao.getAttendanceBean(lecNum);
		UserDao userDao = new UserDao();
		ArrayList<UserDto> userList = userDao.getAttendanceList(lecNum);
		req.setAttribute("bean", classBean);
		req.setAttribute("list", userList);
		System.out.println(classBean);
		System.out.println(userList);
		RequestDispatcher rd = req.getRequestDispatcher("/lms/attendance.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
