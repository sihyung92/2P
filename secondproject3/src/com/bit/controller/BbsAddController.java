package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.BbsDao;

public class BbsAddController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String param1=req.getParameter("title");
		String param2=req.getParameter("id");
		
		String title=param1.trim();
		String id=param2.trim();
		BbsDao dao=new BbsDao();
		dao.insert(title, id);
		resp.sendRedirect("BbsquestList.jsp");
	}
}
