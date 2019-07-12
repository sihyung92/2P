package com.bit.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.ClassDto;
import com.bit.model.lectureDao;

@WebServlet("/lms/lectureedit.bit")
public class LectureEditController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int num = Integer.parseInt(req.getParameter("num"));

		lectureDao dao = new lectureDao();
		ClassDto bean = dao.getLectureEdit(num);

		if (bean != null) {
			req.setAttribute("bean", bean);
		}
		RequestDispatcher rd = req.getRequestDispatcher("/lms/lectureEdit.jsp");

		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		RequestDispatcher rd = req.getRequestDispatcher("/lms/lectureEdit.jsp");
		int num = Integer.parseInt(req.getParameter("num"));
		String name = req.getParameter("name");
		String teacherName = req.getParameter("teacherName");
		Date startdate = Date.valueOf(req.getParameter("startdate"));
		Date enddate = Date.valueOf(req.getParameter("enddate"));
		String classroom = req.getParameter("classroom");
		String attach = req.getParameter("attach");
		String content = req.getParameter("content");

		lectureDao dao = new lectureDao();
		dao.lectureUpdate(name, startdate, enddate, classroom, content, attach,
				teacherName, num);

		resp.sendRedirect(req.getContextPath() + "/lms/lecturedetail.bit?num="
				+ num);
	}
}
