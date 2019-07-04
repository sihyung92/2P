package com.bit.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	public int getLectureOne(int classNum){
		ClassDto bean=new ClassDto();
		String sql="select classNumfrom class";
		
		return 0;
	}
	
	
}
