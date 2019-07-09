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
		// �޴� ������ request.getAttribute("loginWrong")!=null �̸�
		// out.println(request.getAttribute(loginWrong))���Ѿ���
		// session.getAttribute("kind")�� ���� jquery�� ����
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
		//���ΰ�ħ ���� �����ؾ���
		if (bean == null) {
			System.out.println("bean : " + bean);
			req.setAttribute("loginWrong",
					"<script type=\"text/javascript\">alert('ID 혹은 PW를 입력해주세요');</script>");
			// �޴� ������ request.getAttribute(loginWrong)!=null �̸�
			// out.println(request.getAttribute(loginWrong))���Ѿ���
		} else {
			session.setAttribute("isLogin", true);
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			session.setAttribute("userNum", bean.getUserNum());
			session.setAttribute("userKind", bean.getUserKind());// 0�л� 1���� 2������
			if(bean.getUserKind()!=2) {
				session.setAttribute("lecNum",bean.getUserKind());
			}
		}
		doGet(req, resp);
	}
}
