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
public class BbsListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BbsDao dao = new BbsDao();
		RequestDispatcher rd = null;
		String path = req.getRequestURI().replaceAll(req.getContextPath(), "");
		System.out.println(path);
		if (path.equals("/lms/bbsnotice.bbs")) {
			// ArrayList<BbsDto> list = dao.getNoticeList();
			int total = dao.getTotlaCount();
			String param = req.getParameter("page");
			String param2 = req.getParameter("limit");
			if (param == null) {
				param = "1";
			}
			int p = Integer.parseInt(param);

			if (param2 == null) {
				param2 = "10";
			}
			int limit = Integer.parseInt(param2);
			int start = ((p - 1) / 5) * 5;
			int end = total / limit;
			if (total % limit != 0) {
				end++;
			}
			int end2 = end;
			if (start + 5 < end) {
				end = start + 5;
			}

			ArrayList<BbsDto> list = dao.getNoticeList2(p, limit);

			req.setAttribute("list", list);
			rd = req.getRequestDispatcher("/lms/bbsNotice.jsp");
		} else if (path.equals("/lms/question.bbs")) {
			ArrayList<BbsDto> list = dao.getQuestionList();
			req.setAttribute("list", list);
			rd = req.getRequestDispatcher("/lms/bbsquestList.jsp");
		}else if(path.equals("/lms/material.bbs")) {  
			ArrayList<BbsDto> list = dao.getmaterialList();
			req.setAttribute("list", list);
			rd = req.getRequestDispatcher("bbsmateriallist.jsp");//수업자료게시판 
		}else if(path.equals("/lms/assignment.bbs")){
			ArrayList<BbsDto> list=dao.getAssignmentList();
			req.setAttribute("list", list);
			rd=req.getRequestDispatcher("bbsassignmentlist.jsp");//과제게시판
		}
		rd.forward(req, resp);
	}
}
