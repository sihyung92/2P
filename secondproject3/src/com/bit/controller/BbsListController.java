package com.bit.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.BbsDao;
import com.bit.model.BbsDto;
@WebServlet("*.bbs")
public class BbsListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				BbsDao dao = new BbsDao();
				RequestDispatcher rd = null;
				String path = req.getRequestURI().replaceAll(req.getContextPath(),"");
				System.out.println(path);
				if(path.equals("/lms/notice.bbs")) {
					ArrayList<BbsDto> list = dao.getNoticeList();
					req.setAttribute("list", list);
					rd = req.getRequestDispatcher("bbsnoticelist.jsp");//공지사항게시판
				}else if(path.equals("/lms/question.bbs")) {
					ArrayList<BbsDto> list = dao.getQuestionList();
					req.setAttribute("list", list);
					rd = req.getRequestDispatcher("bbsquestList.jsp");//질문게시판
				}else if(path.equals("/lms/material.bbs")) {  
					ArrayList<BbsDto> list = dao.getmaterialList();
					req.setAttribute("list", list);
					rd = req.getRequestDispatcher("bbsteachermateriallist.jsp");//수업자료게시판 
				}
			
				rd.forward(req, resp);
	}
	
}
