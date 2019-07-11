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
		String sql = "SELECT userNum,userKind,lecNum FROM userData WHERE id=? AND pw=?";
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
				bean.setLecNum(rs.getInt("lecNum"));
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

	public int edit(String id, String pw, String name,String address, String birth, String email, String major, int phone) {
		String sql ="UPDATE userData SET pw=?, address=?, name=?, birth=TO_DATE(?,'YYYY-MM-DD'), email=?, major=?, phone=? where id="+id;
		conn=Connector.getConnection();
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, address);
			pstmt.setString(3, name);
			pstmt.setString(4, birth);
			pstmt.setString(5, email);
			pstmt.setString(6, major);
			pstmt.setInt(7,phone);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return result;
	}

	public int register(String id, String pw, String name,String address, String birth, String email, String major, int phone, int userKind) {
		String sql = "INSERT INTO userData VALUES ()";
		int result=0;
		return result;
	}
	
	public int loginCheck(String id) {
		String sql = "SELECT * FROM userData WHERE id=?";
		int result = 0;
		conn=Connector.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return ++result; 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
