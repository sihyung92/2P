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

	public ArrayList<UserDto> getAttendanceList(int lecNum) {
		ArrayList<UserDto> list = new ArrayList<UserDto>();
		String sql = "SELECT name, userKind, userNum FROM userData where lecNum=?";
		conn=Connector.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lecNum);
			rs=pstmt.executeQuery();
			while(rs.next()) {

				bean = new UserDto();
				bean.setName(rs.getString("name"));
				bean.setUserKind(rs.getInt("UserKind"));
				bean.setUserNum(rs.getInt("UserNum"));
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

	public ArrayList<UserDto> getList() {
		ArrayList<UserDto> list = new ArrayList<UserDto>();
		String sql = "SELECT * FROM userData WHERE ";
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
		} finally {
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
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

	public int edit(String id, String pw, String name, String address,
			String birth, String email, String major, int phone, String lecNum) {
		String sql = "UPDATE userData SET pw=?, address=?, name=?, birth=TO_DATE(?,'YYYY-MM-DD'), email=?, major=?, phone=?, lecNum=? where id='"
				+ id + "'";
		boolean isAdmin = false;
		int lecture = 1;
		if (lecNum == "") {
			isAdmin = true;
		} else {
			lecture = Integer.parseInt(lecNum);
		}
		conn = Connector.getConnection();
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, address);
			pstmt.setString(3, name);
			pstmt.setString(4, birth);
			pstmt.setString(5, email);
			pstmt.setString(6, major);
			pstmt.setInt(7, phone);
			if (isAdmin) {
				pstmt.setString(8, null);
			} else {
				pstmt.setInt(8, lecture);
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return result;
	}

	public int register(String id, String pw, int userKind, int userNum,
			String name, String address, String birth, String email,
			String major, int phone, String lecNum) {
		boolean isAdmin = false;
		int lecture = 1;
		if (lecNum == "") {
			isAdmin = true;
		} else {
			lecture = Integer.parseInt(lecNum);
		}
		String sql = "INSERT INTO userData VALUES (userData_" + userKind
				+ "_seq.nextval," + userKind + ",?,'" + id + "','" + pw + "','"
				+ name + "','" + birth + "',";
		sql += phone + ",'" + email + "','" + address + "','" + major + "')";
		System.out.println(sql);
		int result = 0;
		conn = Connector.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			if (isAdmin) {
				pstmt.setString(1, null);
			} else {
				pstmt.setInt(1, lecture);
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return result;
	}

	public int idCheck(String id) {
		String sql = "SELECT * FROM userData WHERE id=?";
		int result = 0;
		conn = Connector.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return ++result;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return result;
	}

	public ArrayList<String> getStudent(int num) {
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select name from userData where userKind=0 and lecNum = ?";
		conn = Connector.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString("name"));
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
