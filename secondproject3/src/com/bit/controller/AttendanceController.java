package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.ClassDao;
import com.bit.model.ClassDto;
@WebServlet("/lms/attendance.bit")
public class AttendanceController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int lecNum = Integer.parseInt(req.getParameter("lecNum"));
		ClassDao dao = new ClassDao();
		ClassDto bean = dao.getAttendanceBean(lecNum);
		req.setAttribute("bean", bean);
		RequestDispatcher rd = req.getRequestDispatcher("/lms/attendance.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
