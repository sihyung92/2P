package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.lectureDao;

@WebServlet("/lms/lecturedelete.bit")
public class LectureDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));

		lectureDao dao = new lectureDao();
		System.out.println("lec del con // method=get // lecNum=" + num);
		dao.lectureDelete(num);

		resp.sendRedirect(req.getContextPath() + "/lms/lecturemanage.bit");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
