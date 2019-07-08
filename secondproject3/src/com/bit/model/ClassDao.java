package com.bit.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.bit.util.Connector;

public class ClassDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ArrayList<ClassDto> getList(){
		ArrayList<ClassDto> list=new ArrayList<ClassDto>();
		String sql="select num,name,TO_CHAR(startdate,'YYYY-MM-DD') as startdate,TO_CHAR(enddate,'YYYY-MM-DD') as enddate,classroom,content,attach,teacherName from lecture order by num";
		try {
			conn = Connector.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ClassDto bean=new ClassDto();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setStartdate(rs.getString("startdate"));
				bean.setEnddate(rs.getString("enddate"));
				bean.setClassroom(rs.getString("classroom"));
				bean.setContent(rs.getString("content"));
				bean.setAttach(rs.getString("attach"));
				bean.setTeacherName(rs.getString("teacherName"));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return list;
	}
	
	public ArrayList<ClassDto> getIntroList(){
		ArrayList<ClassDto> list=new ArrayList<ClassDto>();
		String sql="select num,name,TO_CHAR(startdate,'YYYY-MM-DD') as startdate,TO_CHAR(enddate,'YYYY-MM-DD') as enddate,teacherName,content from lecture where startdate>=sysdate order by startdate";
		//오늘 이후 데이터만 가져옴 시간순정렬.
		try {
			conn = Connector.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ClassDto bean=new ClassDto();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setStartdate(rs.getString("startdate"));
				bean.setEnddate(rs.getString("enddate"));
				String totalDate = rs.getString("startdate")+"~"+rs.getString("enddate");
				bean.setTotalDate(totalDate);
				bean.setTeacherName(rs.getString("teacherName"));
				bean.setContent(rs.getString("content"));
				boolean isRecruiting = true;
//				if(0>new Date().compareTo(java.sql.Date.valueOf(rs.getString("startdate")))){
//					isRecruiting = true;
//				};
				//날짜를 비교하여 시작날짜가 현재날짜보다 뒤라면 모집중(isRecruiting = true), 아니라면 마감(isRecruiting = false)
				//구현해야할 기능 : 회원테이블에서 kind가 학생이면서 해당강의를 듣는사람의 숫자가 <30이면 isRe~=true(모집중)아니면 false(마감)
				bean.setRecruitng(isRecruiting);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return list;
	}
}
