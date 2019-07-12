package com.bit.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.model.BbsDao;
import com.bit.model.BbsDto;
import com.bit.model.UserDao;
import com.bit.model.UserDto;

@WebServlet("/lms/intro.bit")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("LoginController / method : get");
		HttpSession session= req.getSession();
		System.out.println("세션isNew : "+session.isNew());
		BbsDao dao = new BbsDao();
		ArrayList<BbsDto> list = dao.getNoticeList();
		req.setAttribute("list", list);
		RequestDispatcher rd = req.getRequestDispatcher("/lms/intro.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("LoginController / method : post");
		UserDao dao = new UserDao();
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		UserDto bean = dao.login(id, pw);
		HttpSession session = req.getSession();
		if (bean == null) {
			System.out.println("로그인에러");
			req.setAttribute("loginWrong",
					"<script type=\"text/javascript\">alert('ID 혹은 PW를 확인해주세요');</script>");
		} else {
			session.setAttribute("isLogin", true);
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("userNum",  ""+bean.getUserNum());
			session.setAttribute("userKind", ""+bean.getUserKind());
			session.setAttribute("lecNum",  ""+bean.getLecNum());
		}
		doGet(req,resp);
	}
}