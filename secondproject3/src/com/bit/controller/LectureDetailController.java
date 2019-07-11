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

@WebServlet("/lecturedetail.bit")
public class LectureDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/lectureDetail.jsp");
		ArrayList<ClassDto> list = new ArrayList<ClassDto>();
		ClassDao dao = new ClassDao();
		list = dao.getIntroList();
		req.setAttribute("bean", list);
		rd.forward(req, resp);
	}
}
