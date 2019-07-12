package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.ClassDto;
import com.bit.model.UserDao;
import com.bit.model.lectureDao;

@WebServlet("/lms/lecturedetail.bit")
public class LectureDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd = req
				.getRequestDispatcher("/lms/lectureDetail.jsp");

		// 강좌 상세 내용.
		int num = Integer.parseInt(req.getParameter("num"));
		ClassDto bean = new ClassDto();
		lectureDao dao = new lectureDao();
		bean = dao.getLectureEdit(num);
		req.setAttribute("bean", bean);

		// 강좌별 학생 목록
		UserDao dao2 = new UserDao();
		req.setAttribute("stulist", dao2.getStudent(num));

		rd.forward(req, resp);
	}
}