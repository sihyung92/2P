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
		//���� ���� �����͸� ������ �ð�������.
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
				//��¥�� ���Ͽ� ���۳�¥�� ���糯¥���� �ڶ�� ������(isRecruiting = true), �ƴ϶�� ����(isRecruiting = false)
				//�����ؾ��� ��� : ȸ�����̺��� kind�� �л��̸鼭 �ش簭�Ǹ� ��»���� ���ڰ� <30�̸� isRe~=true(������)�ƴϸ� false(����)
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
