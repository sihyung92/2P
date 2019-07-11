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

	public int register(String id, String pw, int userKind,int userNum,String name,String address, String birth, String email, String major, int phone, int lecNum) {
		String sql = "MERGE INTO userData u USING dual ON (u.userNum=? AND u.userKind=?)\nWHEN MATCHED THEN\n";
		sql+="UPDATE SET u.pw='"+pw+"',u.name='"+name+"',u.birth='"+birth+"',u.phone="+phone+",u.email='"+email+"',u.address='"+address+"',u.major='"+major+"'\n";
		sql+="WHEN NOT MATCHED THEN\n";
		sql+="INSERT VALUES (userData_"+userKind+"_seq.nextval,"+userKind+","+lecNum+",'"+id+"','"+pw+"','"+name+"','"+birth+"',"+phone+",'"+email+"','"+address+"','"+major+"')";
		System.out.println(sql);
		//(userData_0_seq.nextval,0,1,'id','pw','name','1992-06-01','01027032283','email','address','major');
		int result=0;
		conn=Connector.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, userKind);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
