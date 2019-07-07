package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.model.UserDao;

@WebServlet("/lms/intro.bit")
public class LoginController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/lms/intro.jsp");
		System.out.println("get");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao dao = new UserDao();
		/*
		 * dao.login();
		 * post에서 sendredirect 시켰을 때 get방식으로 가게됨. dopost에서 session에 필요한 정보를 담아서 get으로 보내면 될듯
		 * get에서 보내는 페이지에서 session에서 가진정보로 이것저것하고
		 */
		System.out.println("post");
		resp.sendRedirect(req.getContextPath()+"/lms/intro.bit");
	}
}
