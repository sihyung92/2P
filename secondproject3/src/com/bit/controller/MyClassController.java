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
import com.bit.model.BbsDao;
import com.bit.model.BbsDto;
import com.bit.model.ClassDao;
import com.bit.model.ClassDto;

@WebServlet("/lms/myClass.bit")
public class MyClassController extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		AttendanceDao atteDao = new AttendanceDao();
		int[] myRate = null;
		int lecNum=1;
		String param2 = (String) session.getAttribute("userKind");
		int userKind= Integer.parseInt(param2);
		if(userKind!=2){
			String param1 = (String) session.getAttribute("lecNum");
			lecNum= Integer.parseInt(param1);
			int userNum = Integer.parseInt((String)session.getAttribute("userNum"));
			myRate= atteDao.myRate(userNum);
			//int userKind = (Integer)session.getAttribute("userKind");
		}else{
			lecNum=Integer.parseInt(req.getParameter("lecNum"));
		}
		String day = (String)session.getAttribute("day");
		ArrayList<ArrayList<String>> daliyList = atteDao.getTecherDaliyList(day);
		req.setAttribute("daliyList", daliyList);
		req.setAttribute("myRate", myRate);
		
		ClassDao dao = new ClassDao();
		ClassDto bean= dao.LecDetail(lecNum);
		ArrayList<ClassDto> beanAsc = new ArrayList<ClassDto>();
		beanAsc = dao.getListAsc();
		//System.out.println(bean.getName());
		BbsDao bDao = new BbsDao();
		
		req.setAttribute("bean", bean);
		req.setAttribute("beanAsc",beanAsc);
		req.setAttribute("bbs3List", bDao.precedenceList(lecNum,3));
		req.setAttribute("bbs2List", bDao.precedenceList(lecNum,2));
		req.setAttribute("bbs1List", bDao.precedenceList(lecNum,1));
		req.setAttribute("lecNum", lecNum);
		RequestDispatcher rd = req.getRequestDispatcher("/lms/myClass.jsp");
		rd.forward(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	}
}
