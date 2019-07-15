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

@WebServlet("/lms/bbsnoticedetail.bit")
public class BbsNoticeDetailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd = req
				.getRequestDispatcher("/lms/bbsNoticeDetail.jsp");

		int listNum = Integer.parseInt(req.getParameter("listnum"));

		BbsDao dao = new BbsDao();
		BbsDto bean = dao.getNoticDetail(listNum);
		req.setAttribute("bean", bean);
		req.setAttribute("listNum", listNum);

		rd.forward(req, resp);
	}
}
