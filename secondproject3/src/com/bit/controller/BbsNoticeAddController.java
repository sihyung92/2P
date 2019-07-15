package com.bit.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.model.BbsDao;

@WebServlet("/lms/bbsnoticeadd.bit")
public class BbsNoticeAddController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd = req
				.getRequestDispatcher("/lms/bbsNoticeAdd.jsp");

		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		BbsDao dao = new BbsDao();
		// int lecNum = Integer.parseInt(req.getParameter("lecNum"));
		String title = req.getParameter("title");
		String id = req.getParameter("id");
		String attach = req.getParameter("attach");
		String content = req.getParameter("content");

		dao.getNoticeAdd(title, id, attach, content);

		resp.sendRedirect(req.getContextPath() + "/lms/bbsnotice.bbs");
	}
}	
