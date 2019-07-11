package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.UserDao;

@WebServlet("/useridcheck.bit")
public class UserIdCheckController extends HttpServlet {
	//i want to ajax die,,,need modify
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao dao = new UserDao();
		String id = req.getParameter("id");
		System.out.println("user id check controller / method : get");
		RequestDispatcher rd = req.getRequestDispatcher(req.getContextPath()+"/data/idcheck.jsp");
		rd.forward(req, resp);
	}
}
