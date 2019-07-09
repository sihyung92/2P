package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.ClassDto;
import com.bit.model.lectureDao;

@WebServlet("/lms/lectureedit.bit")
public class lectureEditController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/lms/lectureEdit.jsp");
		int num = Integer.parseInt(req.getParameter("num"));
		lectureDao dao = new lectureDao();
		ClassDto bean = dao.getLectureEdit(num);
		req.setAttribute("bean", bean);
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/lms/lectureEdit.jsp");
		int num = Integer.parseInt(req.getParameter("num"));
		lectureDao dao = new lectureDao();
		ClassDto bean = dao.getLectureEdit(num);
		req.setAttribute("bean", bean);
		rd.forward(req, resp);
	}
}
