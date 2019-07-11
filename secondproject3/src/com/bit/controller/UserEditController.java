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

@WebServlet("/lms/useredit.bit")
public class UserEditController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/lms/userEdit.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.setAttribute("userNum", 1);
		int userNum = (Integer) session.getAttribute("userNum");
		UserDao dao = new UserDao();
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String address = req.getParameter("addr");
		String birth = req.getParameter("birth");
		String email = req.getParameter("email");
		String major = req.getParameter("major");
		int userKind = Integer.parseInt(req.getParameter("userKind"));
		int phone = Integer.parseInt(req.getParameter("phone"));
		int lecNum = -1;
		if (req.getParameter("lecNum") != "") {
			Integer.parseInt(req.getParameter("lecNum"));
		}
		int result = dao.register(id, pw, userKind, userNum, name, address, birth, email, major, phone, lecNum);
		System.out.println("레지스터 성공 : 1 실패 : 0 = "+result);
	}
}
