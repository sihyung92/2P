package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.BbsDao;

@WebServlet("/lms/bbsnoticedelete.bit")
public class BbsNoticeDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int listNum = Integer.parseInt(req.getParameter("listnum"));
		BbsDao dao = new BbsDao();
		dao.getNoticeDelete(listNum);

		resp.sendRedirect(req.getContextPath() + "/lms/bbsnotice.bbs");
	}

}
