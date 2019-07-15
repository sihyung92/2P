package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.BbsDao;
import com.bit.model.BbsDto;

@WebServlet("/lms/bbsnoticeedit.bit")
public class BbsNoticeEditController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd = req
				.getRequestDispatcher("/lms/bbsNoticeEdit.jsp");
		int listNum = Integer.parseInt(req.getParameter("listnum"));

		BbsDao dao = new BbsDao();
		BbsDto bean = dao.getNoticDetail(listNum);
		req.setAttribute("bean", bean);
		req.setAttribute("listNum", listNum);

		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int listNum = Integer.parseInt(req.getParameter("listNum"));
		String title = req.getParameter("title");
		String attach = req.getParameter("attach");
		String content = req.getParameter("content");
		BbsDao dao = new BbsDao();
		int result = dao.getNoticeUpdate(title, attach, content, listNum);
		if (result > 0) {
			resp.sendRedirect(req.getContextPath()
					+ "/lms/bbsnoticedetail.bit?listnum=" + listNum);
		}
	}
}
