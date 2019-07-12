package com.bit.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bit.util.Connector;

public class lectureDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ClassDto getLectureEdit(int num) {
		String sql = "select num,name,TO_CHAR(startdate,'YYYY-MM-DD') as startdate,TO_CHAR(enddate,'YYYY-MM-DD') as enddate,"
				+ "classroom,content,attach,teacherName from lecture where num=?";
		ClassDto bean = new ClassDto();
		try {
			conn = Connector.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setStartdate(rs.getString(3));
				bean.setEnddate(rs.getString(4));
				bean.setClassroom(rs.getString(5));
				bean.setContent(rs.getString(6));
				bean.setAttach(rs.getString(7));
				bean.setTeacherName(rs.getString(8));
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

	public int lectureAdd(String name, Date startdate, Date enddate,
			String classroom, String content, String attach, String teacherName) {
		int result = 0;
		String sql = "insert into LECTURE values (lecture_seq.nextval,?,?,?,?,?,?,?)";
		ClassDto bean = new ClassDto();
		try {
			conn = Connector.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setDate(2, startdate);
			pstmt.setDate(3, enddate);
			pstmt.setString(4, classroom);
			pstmt.setString(5, content);
			pstmt.setString(6, attach);
			pstmt.setString(7, teacherName);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}

		return result;
	}

	public int lectureUpdate() {
		int result = 0;
		String sql = "update lecture set sub=?,nalja=to_date(?,'yyyy-mm-dd'),pay=? where num=?";
		return result;
	}
}
