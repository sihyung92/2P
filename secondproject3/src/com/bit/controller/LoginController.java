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
		 * post���� sendredirect ������ �� get������� ���Ե�. dopost���� session�� �ʿ��� ������ ��Ƽ� get���� ������ �ɵ�
		 * get���� ������ ���������� session���� ���������� �̰������ϰ�
		 */
		System.out.println("post");
		resp.sendRedirect(req.getContextPath()+"/lms/intro.bit");
	}
}
