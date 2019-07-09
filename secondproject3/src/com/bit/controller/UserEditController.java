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

@WebServlet("/lms/useredit.bit")
public class UserEditController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int kind = (int)session.getAttribute("userKind");
		RequestDispatcher rd = req.getRequestDispatcher("userEdit.jsp");
		UserDao dao = new UserDao();
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String address = req.getParameter("address");
		String birth = req.getParameter("birth");
		String email = req.getParameter("email");
		String major = req.getParameter("major");
		int userKind = Integer.parseInt(req.getParameter("kind"));
		int phone = Integer.parseInt(req.getParameter("phone"));
		if(req.getParameter("id")!=null) {
			rd = req.getRequestDispatcher("/lms/intro.jsp");
			if(kind!=3) {
				dao.edit(id, pw, name, address, birth, email, major, phone);
			}else {
				dao.register(id, pw, name, address, birth, email, major, phone,userKind);
			}
		}
		rd.forward(req,resp);
	}
}
