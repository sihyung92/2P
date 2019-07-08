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
import com.bit.model.UserDto;

@WebServlet("/lms/intro.bit")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("LoginController / method : get");
		RequestDispatcher rd = req.getRequestDispatcher("/lms/intro.jsp");
		// 받는 곳에서 request.getAttribute("loginWrong")!=null 이면
		// out.println(request.getAttribute(loginWrong))시켜야함
		// session.getAttribute("kind")에 따라 jquery로 제어
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
		//새로고침 문제 수정해야함
		if (bean == null) {
			System.out.println("bean : " + bean);
			req.setAttribute("loginWrong",
					"<script type=\"text/javascript\">alert('아이디 혹은 비밀번호를 다시 확인해주세요');</script>");
			// 받는 곳에서 request.getAttribute(loginWrong)!=null 이면
			// out.println(request.getAttribute(loginWrong))시켜야함
		} else {
			session.setAttribute("isLogin", true);
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("userNum", bean.getUserNum());
			session.setAttribute("userKind", bean.getUserKind());// 0학생 1강사 2관리자
		}
		doGet(req, resp);
	}
}
