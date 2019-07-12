package com.bit.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.lectureDao;

@WebServlet("/lms/lectureadd.bit")
public class LectureAddController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/lms/lectureAdd.jsp");

		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name");
		String teacherName = req.getParameter("teacherName");
		Date startdate = Date.valueOf(req.getParameter("startdate"));
		Date enddate = Date.valueOf(req.getParameter("enddate"));
		String classroom = req.getParameter("classroom");
		String attach = req.getParameter("attach");
		String content = req.getParameter("content");

		lectureDao dao = new lectureDao();
		dao.lectureAdd(name, startdate, enddate, classroom, content, attach,
				teacherName);

		resp.sendRedirect(req.getContextPath() + "/lms/lecturemanage.bit");

	}

}
