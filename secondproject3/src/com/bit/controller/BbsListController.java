package com.bit.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.BbsDao;
import com.bit.model.BbsDto;

public class BbsListController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			BbsDao dao=new BbsDao();
			ArrayList<BbsDto> list=dao.getList();
			
			req.setAttribute("alist", list);
			
			RequestDispatcher rd=req.getRequestDispatcher("BbsqueststuList.jsp");
			rd.forward(req, resp);
	}
	
}
