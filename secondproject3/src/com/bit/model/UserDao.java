package com.bit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.util.Connector;

public class UserDao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	UserDto bean;

	public UserDto login(String id, String pw) {
		String sql = "SELECT userNum,kind FROM userData WHERE id=? AND pw=?";
		conn = Connector.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean = new UserDto();
				bean.setUserNum(rs.getInt("userNum"));
				bean.setUserKind(rs.getInt("userKind"));
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
<<<<<<< HEAD

	public UserDto getList() {
		return bean;
=======
	public ArrayList<UserDto> getList() {
		ArrayList<UserDto> list = new ArrayList<UserDto>();
		String sql = "";
		conn=Connector.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bean = new UserDto();
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
>>>>>>> refs/remotes/origin/user_infomation_edit_backend
	}

	public UserDto detail(String id) {
		String sql = "SELECT * FROM userData WHERE id=?";
		conn = Connector.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setUserNum(rs.getInt("userNum"));
				bean.setUserKind(rs.getInt("userKind"));
				bean.setAddress(rs.getString("address"));
				bean.setBirth(rs.getDate("birth"));
				bean.setEmail(rs.getString("email"));
				bean.setId(id);
				bean.setPw(rs.getString("pw"));
				bean.setLecNum(rs.getInt("lecNum"));
				bean.setMajor(rs.getString("major"));
				bean.setName(rs.getString("name"));
				bean.setPhone(rs.getInt("phone"));
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
<<<<<<< HEAD

	public void edit(String pw, String address, String birth, String email,
			String major, int phone) {
		String sql = "UPDATE userData SET pw=?, address=?, birth=TO_DATE(?,'YYYY-MM-DD'), email=?, major=?, phone=?";
		conn = Connector.getConnection();
=======
	
	public int edit(String id, String pw, String address, String birth, String email, String major, int phone) {
		String sql ="UPDATE userData SET pw=?, address=?, birth=TO_DATE(?,'YYYY-MM-DD'), email=?, major=?, phone=? where id="+id;
		conn=Connector.getConnection();
		int result = 0;
>>>>>>> refs/remotes/origin/user_infomation_edit_backend
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, address);
			pstmt.setString(3, birth);
			pstmt.setString(4, email);
			pstmt.setString(5, major);
<<<<<<< HEAD
			pstmt.setInt(6, phone);
=======
			pstmt.setInt(6,phone);
			result = pstmt.executeUpdate();
>>>>>>> refs/remotes/origin/user_infomation_edit_backend
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return result;
	}
<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/user_infomation_edit_backend
}
