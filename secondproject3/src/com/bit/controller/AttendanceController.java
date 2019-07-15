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

import com.bit.model.AttendanceDao;
import com.bit.model.AttendanceDto;
import com.bit.model.ClassDao;
import com.bit.model.ClassDto;
import com.bit.model.UserDao;
import com.bit.model.UserDto;
import com.bit.test.DaoTest;

@WebServlet("/lms/attendance.bit")
public class AttendanceController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int userKind = Integer.parseInt((String)session.getAttribute("userKind"));
		int lecNum = Integer.parseInt(req.getParameter("lecNum"));
		String day = (String)session.getAttribute("day");
		ClassDao classDao = new ClassDao();
		ClassDto classBean = classDao.getAttendanceBean(lecNum);
		ClassDto classBean2= classDao.LecDetail(lecNum);
		AttendanceDao atteDao = new AttendanceDao();
		UserDao userDao = new UserDao();
		ArrayList<UserDto> userList = userDao.getAttendanceList(lecNum);
		ArrayList<AttendanceDto> atteList = atteDao.getAttendanceRate(lecNum);
		ArrayList<ArrayList<String>> daliyList = atteDao.getTecherDaliyList(day);
		ArrayList<ClassDto> beanAsc = classDao.getListAsc();
		req.setAttribute("bean", classBean);
		req.setAttribute("userList", userList);
		req.setAttribute("atteList", atteList);
		req.setAttribute("lecNum", lecNum);
		req.setAttribute("daliy", daliyList);
		req.setAttribute("beanAsc",beanAsc);
		req.setAttribute("bean2", classBean2);
		RequestDispatcher rd = req.getRequestDispatcher("/lms/attendance.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// td유저넘and날짜and0출석,1세모,2엑스
		HttpSession session = req.getSession();
		String[] data = req.getParameterValues("data");
		int lecNum = Integer.parseInt(req.getParameter("lecNum"));
		AttendanceDao dao = new AttendanceDao();
		ArrayList<String[]> list = new ArrayList<String[]>();
		for (String content : data) {
			if (!content.equals("")) {
				list.add(content.split("and"));
			}
		}
		dao.insert(list,lecNum);
		resp.sendRedirect(req.getContextPath()+"/lms/attendance.bit?lecNum="+lecNum);
	}
}