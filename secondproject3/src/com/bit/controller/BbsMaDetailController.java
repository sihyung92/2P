package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.BbsDao;
import com.bit.model.BbsDto;

@WebServlet("/lms/bbsmaterialdetail.bit")
public class BbsMaDetailController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int listNum=Integer.parseInt(req.getParameter("listNum"));
		int lecNum=Integer.parseInt(req.getParameter("lecNum"));
		BbsDao dao=new BbsDao();
		req.setAttribute("detail", dao.materialdetail(listNum, lecNum));
		
		RequestDispatcher rd=req.getRequestDispatcher("bbsmaterialdetail.jsp");
		rd.forward(req,resp);
		
	}
}