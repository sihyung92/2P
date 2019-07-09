package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.BbsDao;

public class BbsdeleteController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int num=Integer.parseInt(req.getParameter("num"));
		int bbsnum=Integer.parseInt(req.getParameter("bbsnum"));
		BbsDao dao=new BbsDao();
		dao.delete(num,bbsnum);
		resp.sendRedirect("BbsquestuList.jsp");
	}
}
