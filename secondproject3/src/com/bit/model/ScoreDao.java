package com.bit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bit.util.Connector;

public class ScoreDao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	public ScoreDto MyScore(int userNum){
		conn=Connector.getConnection();
		ScoreDto bean = new ScoreDto();
		String sql = "SELECT scoreNum,userNum,firstTest,secondTest,thirdTest,lecNum FROM score WHERE userNum=?";
		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs=pstmt.executeQuery();
			int lecNum=1;
			if(rs.next()) {
				bean.setScoreNum(rs.getInt("scoreNum"));
				bean.setUserNum(rs.getInt("userNum"));;
				bean.setFirstTest(rs.getString("firstTest"));
				bean.setSecondTest(rs.getString("secondTest"));
				bean.setThirdTest(rs.getString("thirdTest"));
			}
			Connector.close(rs);
			Connector.close(pstmt);
			String sql2 = "SELECT name,lecNum FROM userData WHERE userNum=? AND userKind=0";
			pstmt=conn.prepareStatement(sql2);
			pstmt.setInt(1, userNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				lecNum=rs.getInt("lecNum");
				bean.setName(rs.getString("name"));
			}
			Connector.close(rs);
			Connector.close(pstmt);
			String sql3 = "SELECT name FROM lecture WHERE num=?";
			pstmt=conn.prepareStatement(sql3);
			pstmt.setInt(1, lecNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bean.setLecName(rs.getString("name"));
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
}
