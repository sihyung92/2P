package com.bit.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BbsDao {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="hr";
	String password="hr";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ArrayList<BbsDto> getList(){
		ArrayList<BbsDto> list=new ArrayList<BbsDto>();
		String sql="select * from lmsBbs";
		
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, password);
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				BbsDto bean=new BbsDto();
				bean.setListNum(rs.getInt("listNum"));
				bean.setBbsNum(rs.getInt("bbsNum"));
				bean.setNum(rs.getInt("num"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setStatus(rs.getString("status"));
				bean.setId(rs.getString("id"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setViews(rs.getInt("view"));
				bean.setAttach(rs.getString("attach"));
				list.add(bean);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return list;
	}
	
	
	public BbsDto detail(int num,int bbsNum){
		BbsDto bean=new BbsDto();
		String sql="select * from lmsBbs where num=? and bbsNum=?";
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, password);
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2,bbsNum);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setTitle(rs.getString("title"));
				bean.setId(rs.getString("id"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setContent(rs.getString("content"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return bean;
	}
	
	public int delete(int num,int bbsNum){
		int result=0;
		String sql="delete from lmsBbs where num=? and bbsNum=?";
		try {
			conn=DriverManager.getConnection(url, user, password);
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, bbsNum);
			rs=pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	public void insert(String title, String id){
		String sql="insert into lmsBbs(num,title,status,id,nalja,views) values(lmsBbs_2_seq.nextval,?,'미해결',?,sysdate,0)";
		
		try {
				conn=DriverManager.getConnection(url, user, password);
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, title);
				pstmt.setString(2, id);
				int result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
		public int update(String sub, String content, int bbsNum, int num){
			int result=0;
			String sql="update lmsBbs set sub=?,content=? where num=? and bbsNum=?";
			try {
				Class.forName(driver);
				conn=DriverManager.getConnection(url,user,password);
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, sub);
				pstmt.setString(2, content);
				pstmt.setInt(3, bbsNum);
				pstmt.setInt(4, num);
				result=pstmt.executeUpdate();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				try {
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return result;
		}
		
}

