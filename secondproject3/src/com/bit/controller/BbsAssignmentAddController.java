package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.model.BbsDao;

public class BbsAssignmentAddController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		RequestDispatcher rd=req.getRequestDispatcher("bbsassignmentadd.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session=req.getSession();
		String param=(String)session.getAttribute("userKind");
		
		int userkind=Integer.parseInt(param);
		
		String param1=req.getParameter("title");
		String param2=req.getParameter("content");
		String title=param1.trim();
		String content=param2.trim();
		
		String id=(String)session.getAttribute("id");
		
		int lecNum=Integer.parseInt((String)session.getAttribute("lecNum"));
		
		BbsDao dao=new BbsDao();
		
		dao.assignmentInsert(lecNum, title, content, id);
		
		resp.sendRedirect("assignment.bbs");
		
	}
}
