package com.bit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.util.Connector;

public class ClassDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ArrayList<ClassDto> getList() {
		ArrayList<ClassDto> list = new ArrayList<ClassDto>();
		String sql = "select num,name,TO_CHAR(startdate,'YYYY-MM-DD') as startdate,TO_CHAR(enddate,'YYYY-MM-DD') as enddate,classroom,content,attach,teacherName from lecture order by num desc";
		try {
			conn = Connector.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ClassDto bean = new ClassDto();
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
		} finally {
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return list;
	}

	public ArrayList<ClassDto> getIntroList() {
		ArrayList<ClassDto> list = new ArrayList<ClassDto>();
		String sql = "select num,name,TO_CHAR(startdate,'YYYY-MM-DD') as startdate,";
			sql+="TO_CHAR(enddate,'YYYY-MM-DD') as enddate,teacherName,content from lecture ";
			sql+="where startdate>=sysdate order by startdate";
		try {
			conn = Connector.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ClassDto bean = new ClassDto();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setStartdate(rs.getString("startdate"));
				bean.setEnddate(rs.getString("enddate"));
				String totalDate = rs.getString("startdate") + "~"
						+ rs.getString("enddate");
				bean.setTotalDate(totalDate);
				bean.setTeacherName(rs.getString("teacherName"));
				bean.setContent(rs.getString("content"));
				boolean isRecruiting = true;
				bean.setRecruitng(isRecruiting);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return list;
	}

	public ClassDto getAttendanceBean(int lecNum) {
		ClassDto bean=null;
    String sql="SELECT num,TO_CHAR(startDate,'YYYY-MM-DD') as startDate, TO_CHAR(endDate,'YYYY-MM-DD') as endDate, name from lecture where num=?";
		try {
			conn = Connector.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lecNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean = new ClassDto();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setStartdate(rs.getString("startDate"));
				bean.setEnddate(rs.getString("enddate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return bean;
	}

	public ClassDto LecDetail(int lecNum){
		ClassDto bean=new ClassDto();
		String sql="select num,name,TO_CHAR(startdate,'YYYY-MM-DD') as startdate,TO_CHAR(enddate,'YYYY-MM-DD') as enddate,classroom,content,attach,teacherName from lecture where num=?";
		try {
			conn = Connector.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lecNum);
			rs=pstmt.executeQuery();
			while(rs.next()){
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setStartdate(rs.getString("startdate"));
				bean.setEnddate(rs.getString("enddate"));
				bean.setClassroom(rs.getString("classroom"));
				bean.setContent(rs.getString("content"));
				bean.setAttach(rs.getString("attach"));
				bean.setTeacherName(rs.getString("teacherName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return bean;
	}
	
	public ArrayList<ClassDto> getListAsc() {
		ArrayList<ClassDto> list = new ArrayList<ClassDto>();
		String sql = "select num,name,TO_CHAR(startdate,'YYYY-MM-DD') as startdate,TO_CHAR(enddate,'YYYY-MM-DD') as enddate,classroom,content,attach,teacherName from lecture";
		try {
			conn = Connector.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ClassDto bean = new ClassDto();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return list;
	}
	
	public ArrayList<ClassDto> getLecList() {
		ArrayList<ClassDto> list = new ArrayList<ClassDto>();
		UserDao dao = new UserDao();
		
		String sql = "select (SELECT count(*) from userData WHERE lecNum=L.num AND userKind=0) as personal,";
		sql+="num,name,TO_CHAR(startdate,'YYYY-MM-DD') as startdate,TO_CHAR(enddate,'YYYY-MM-DD') as ";
		sql+="enddate,classroom,content,attach,teacherName from lecture L order by num desc";
		try {
			conn = Connector.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ClassDto bean = new ClassDto();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setStartdate(rs.getString("startdate"));
				bean.setEnddate(rs.getString("enddate"));
				bean.setClassroom(rs.getString("classroom"));
				bean.setContent(rs.getString("content"));
				bean.setAttach(rs.getString("attach"));
				bean.setTeacherName(rs.getString("teacherName"));
				bean.setPersonal(rs.getInt("personal"));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}
		
		return list;
	}
	
}


