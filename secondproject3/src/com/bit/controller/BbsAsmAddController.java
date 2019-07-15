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

@WebServlet("/lms/bbsasmadd.bit")
public class BbsAsmAddController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String param = (String) session.getAttribute("userKind");
		int userKind= Integer.parseInt(param);
		
		RequestDispatcher rd = req.getRequestDispatcher("BbsAsmAdd.jsp");
		rd.forward(req,resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		//////////////test
		//session.setAttribute("lecNum", 1);
		//session.setAttribute("id", "stu01");
		/////////////
		String param1=req.getParameter("title");
		String param2=req.getParameter("content");
		String param3 = (String) session.getAttribute("lecNum");
		int lecNum= Integer.parseInt(param3);
		
		String title=param1.trim();
		String content=param2.trim();
		String id = (String)session.getAttribute("id");
		BbsDao dao=new BbsDao();
		System.out.println("BbsAddcon / method : post / insert result-1성공0실패 : "+dao.assignmentInsert(lecNum, title, content, id));
		resp.sendRedirect("assignment.bbs");
	}
}









