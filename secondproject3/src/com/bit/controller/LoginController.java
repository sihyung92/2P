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
public class LoginController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("LoginController / method : get");
		RequestDispatcher rd = req.getRequestDispatcher("/lms/intro.jsp");
		//�޴� ������ request.getAttribute("loginWrong")!=null �̸� out.println(request.getAttribute(loginWrong))���Ѿ���
		//session.getAttribute("kind")�� ���� jquery�� ����
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("LoginController / method : post");
		UserDao dao = new UserDao();
		UserDto bean = dao.login(req.getParameter("id"),req.getParameter("pw"));
		if(bean==null) {
			req.setAttribute("loginWrong", "<script type=\"text/javascript\">alert('���̵� Ȥ�� ��й�ȣ�� �ٽ� Ȯ�����ּ���');</script>");
			//�޴� ������ request.getAttribute(loginWrong)!=null �̸� out.println(request.getAttribute(loginWrong))���Ѿ���
		}else {
			HttpSession session = req.getSession();
			session.setAttribute("isLogin", true);
			session.setAttribute("id", bean.getId());
			session.setAttribute("pw", bean.getPw());
			session.setAttribute("userNum", bean.getUserNum());
			session.setAttribute("kind", bean.getKind());//0�л� 1���� 2������
		}
		doGet(req,resp);
	}
}
