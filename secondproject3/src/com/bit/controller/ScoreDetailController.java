package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.model.ScoreDao;
import com.bit.model.ScoreDto;
@WebServlet("/lms/grade.bit")
public class ScoreDetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int userNum = Integer.parseInt((String)session.getAttribute("userNum"));
		ScoreDao dao = new ScoreDao();
		ScoreDto bean = dao.MyScore(userNum);
		req.setAttribute("bean", bean);
		RequestDispatcher rd = req.getRequestDispatcher("grade.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
