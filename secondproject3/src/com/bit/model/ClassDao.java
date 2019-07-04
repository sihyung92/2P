package com.bit.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClassDao {

	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:orcle:thin:@localhost:1521:xe";
	private String user="hr";
	private String password="hr";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ClassDao(){
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url,user,password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<ClassDto> getList(){
		ArrayList<ClassDto> list=new ArrayList<ClassDto>();
		String sql="select num,name,startdate,enddate,classroom from lecture order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				
				ClassDto bean=new ClassDto();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setStartdate(rs.getDate("startdate"));
				bean.setEnddate(rs.getDate("enddate"));
				bean.setClassroom(rs.getString("classroom"));
				list.add(bean);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public ClassDto getLectureOne(int num){
		
		ClassDto bean=new ClassDto();
		
		String sql="select name,startdate,enddate,content from lecture where num=?";
		
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				bean.setName(rs.getString("name"));
				bean.setName(rs.getString("startdate"));
				bean.setName(rs.getString("enddate"));
				bean.setName(rs.getString("content"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return bean;
	}
	
	
}
