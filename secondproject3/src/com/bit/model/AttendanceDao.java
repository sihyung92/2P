package com.bit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.util.Connector;

public class AttendanceDao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	public void insert(ArrayList<String[]> list,int lecNum) {
		String sql = "INSERT INTO ATTENDANCE VALUES (attendance_seq.nextval,?,?,?,null,null,?,0)";
		//day,type,lecNum,userNum
		conn = Connector.getConnection();
		try {
			for(String[] values:list) {
				int userNum = Integer.parseInt(values[0]);
				String nalja = values[1];
				int status = Integer.parseInt(values[2]);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,nalja);
				pstmt.setInt(2, status);
				pstmt.setInt(3, lecNum);
				pstmt.setInt(4, userNum);
				int result = pstmt.executeUpdate();
				System.out.println("attendance result 0fail 1success : "+result);
				Connector.close(pstmt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(pstmt);
			Connector.close(conn);
		}
	}
	
	public ArrayList<String> getList(int lecNum){
		ArrayList<String> list = new ArrayList<String>();
		String sql = "SELECT attendanceNum, TO_CHAR(day,'YYYY-MM-DD') day, type, userNum FROM attendance WHERE lecNum = ? AND userKind=0";
		conn = Connector.getConnection();
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, lecNum);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String data = "";
					data+=rs.getInt("userNum")+"and";
					data+=rs.getString("day")+"and";
					data+=rs.getInt("type");
					list.add(data);
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
	
	public ArrayList<AttendanceDto> getAttendanceRate(int lecNum){
		ArrayList<AttendanceDto> list = new ArrayList<AttendanceDto>();
		String sql = "SELECT A.userNum as userNum, ja/mo as rate FROM (SELECT userNum, count(*) as mo FROM attendance WHERE lecNum = ? GROUP BY userNum) A ";
		sql += "inner join (SELECT userNum, count(*) as ja FROM attendance WHERE lecNum = ? AND type between 0 AND 1 GROUP BY userNum) B ON A.userNum=B.userNum ";
		sql += "ORDER BY userNum";
		conn = Connector.getConnection();
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, lecNum);
				pstmt.setInt(2, lecNum);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					AttendanceDto bean = new AttendanceDto();
					bean.setUserNum(rs.getInt("userNum"));
					bean.setRate(rs.getDouble("rate"));
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
	
	public ArrayList<ArrayList<String>> getTecherDaliyList(String day){
		ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
		//출석 쿼리
		String sql1 = "SELECT name FROM attendance A INNER JOIN userData B ON A.userNum=B.userNum WHERE day=? AND type=0 ORDER BY name";
		//지각외출조퇴 쿼리
		String sql2 = "SELECT name FROM attendance A INNER JOIN userData B ON A.userNum=B.userNum WHERE day=? AND type=1 ORDER BY name";
		//결석 쿼리
		String sql3 = "SELECT name FROM attendance A INNER JOIN userData B ON A.userNum=B.userNum WHERE day=? AND type=2 ORDER BY name";
		conn = Connector.getConnection();
		try {
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, day);
				rs = pstmt.executeQuery();
				//0번 어레이리스트 출석자이름 어레이리스트
				ArrayList<String> values= new ArrayList<String>();
				while(rs.next()) {
					values.add(rs.getString("name"));
				}
				list.add(values);
				Connector.close(rs);
				Connector.close(pstmt);
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, day);
				rs = pstmt.executeQuery();
				//1번 어레이리스트 
				values= new ArrayList<String>();
				while(rs.next()) {
					values.add(rs.getString("name"));
				}
				list.add(values);
				Connector.close(rs);
				Connector.close(pstmt);
				pstmt = conn.prepareStatement(sql3);
				pstmt.setString(1, day);
				rs = pstmt.executeQuery();
				//2번 어레이리스트
				values= new ArrayList<String>();
				while(rs.next()) {
					values.add(rs.getString("name"));
				}				
				list.add(values);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return list;
	}
	
	public int[] myRate(int userNum) {
		String sql1 = "SELECT count(*) as cnt FROM attendance WHERE userNum = ? AND type = 0";
		String sql2 = "SELECT count(*) as cnt FROM attendance WHERE userNum = ? AND type = 1";
		String sql3 = "SELECT count(*) as cnt FROM attendance WHERE userNum = ? AND type = 2";
		int total = 0;
		int roll = 0;
		int absent = 0;
		int late = 0;
		conn = Connector.getConnection();
		try {
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, userNum);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					roll=rs.getInt("cnt");
				}
				Connector.close(rs);
				Connector.close(pstmt);
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, userNum);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					late=rs.getInt("cnt");
				}
				Connector.close(rs);
				Connector.close(pstmt);
				pstmt = conn.prepareStatement(sql3);
				pstmt.setInt(1, userNum);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					absent=rs.getInt("cnt");
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}
		total = roll+absent+late;
		int[] data = {roll,total,late,absent};
		return data;		
	}
}
