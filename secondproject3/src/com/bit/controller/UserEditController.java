package com.bit.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.model.UserDao;

@WebServlet("/LMS/userEdit.bit")
public class UserEditController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("");
		rd.forward(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("");
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		String pw = (String)session.getAttribute("pw");
		String address = req.getParameter("address");
		String birth = req.getParameter("birth");
		String email = req.getParameter("email1")+"@"+req.getParameter("email2");
		String major = req.getParameter("major");
		int phone = Integer.parseInt(req.getParameter("phone"));
		UserDao dao = new UserDao();
		dao.edit(id, pw, address, birth, email, major, phone);
		rd.forward(req,resp);
	}
}
