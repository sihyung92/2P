package com.bit.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.model.BbsDao;
import com.bit.model.BbsDto;
@WebServlet("*.bbs")
public class BbsListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			
				HttpSession session = req.getSession();
				String param = (String) session.getAttribute("userKind");
				int userKind= Integer.parseInt(param);
		
				BbsDao dao = new BbsDao();
				RequestDispatcher rd = null;
				String path = req.getRequestURI().replaceAll(req.getContextPath(),"");
				System.out.println(path);
				if(path.equals("/lms/notice.bbs")) {
					ArrayList<BbsDto> list = dao.getNoticeList();
					req.setAttribute("list", list);
					rd = req.getRequestDispatcher("bbsNotice.jsp");
				}else if(path.equals("/lms/question.bbs")) {
					ArrayList<BbsDto> list = dao.getQuestionList();
					req.setAttribute("list", list);
					rd = req.getRequestDispatcher("bbsquestList.jsp");
				}else if(path.equals("/lms/assignment.bbs")) {
					ArrayList<BbsDto> list = dao.getAssignmentList();
					req.setAttribute("list", list);
					BbsDto last = dao.getLastAsm();
					req.setAttribute("last", last);
					rd = req.getRequestDispatcher("bbsAsmList.jsp");
				}
			
				rd.forward(req, resp);
	}
	
}
