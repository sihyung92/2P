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

@WebServlet("/lms/addquadd.bit")
public class BbsAddController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher("bbsQuAdd.jsp");
		rd.forward(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		String param3=(String)session.getAttribute("userKind");
		int userkind=Integer.parseInt(param3);
		
		req.setCharacterEncoding("utf-8");
		
		String param1=req.getParameter("title");
		String param2=req.getParameter("content");
		System.out.print(param1);
			
			String title=null;
			String content=null;
			int lecNum=0;
			String id=null;
		
			lecNum = Integer.parseInt((String)session.getAttribute("lecNum"));
			title=param1.trim();
			content=param2.trim();
			id = (String)session.getAttribute("id");
		
		BbsDao dao=new BbsDao();
		System.out.println("BbsAddcon / method : post / insert result-1성공0실패 : "+dao.questionInsert(lecNum, title, content, id)+"hi"+session.getAttribute("userkind"));
		resp.sendRedirect("question.bbs");
	}
}









