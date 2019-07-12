package com.bit.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.util.Connector;
import com.bit.util.*;

public class BbsDao {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ArrayList<BbsDto> getNoticeList(){
		ArrayList<BbsDto> list=new ArrayList<BbsDto>();
		String sql="select * from lmsBbs where bbsNum=0 order by listnum desc";
		conn=Connector.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				BbsDto bean=new BbsDto();
				bean.setListNum(rs.getInt("listNum"));
				bean.setBbsNum(rs.getInt("bbsNum"));
				bean.setLecNum(rs.getInt("lecnum"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setId(rs.getString("id"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setAttach(rs.getString("attach"));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
				Connector.close(rs);
				Connector.close(pstmt);
				Connector.close(conn);
		}
		return list;
	}
	
	public ArrayList<BbsDto> getQuestionList(){
		ArrayList<BbsDto> list=new ArrayList<BbsDto>();
		String sql="select * from lmsBbs where listnum=1 and bbsNum=0 order by listnum desc";
		conn=Connector.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				BbsDto bean=new BbsDto();
				bean.setListNum(rs.getInt("listNum"));
				bean.setBbsNum(rs.getInt("bbsNum"));
				bean.setLecNum(rs.getInt("lecnum"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setId(rs.getString("id"));
				bean.setNalja(rs.getDate("nalja"));
				bean.setAttach(rs.getString("attach"));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
				Connector.close(rs);
				Connector.close(pstmt);
				Connector.close(conn);
		}
		return list;
	}

	public BbsDto detail(int num,int bbsNum){
		BbsDto bean=new BbsDto();
		String sql="select * from lmsBbs where num=? and bbsNum=?";
		conn=Connector.getConnection();
		try {
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
			e.printStackTrace();
		}finally{
				Connector.close(rs);
				Connector.close(pstmt);
				Connector.close(conn);
		}
		return bean;
	}
	
	public int delete(int num,int bbsNum){
		int result=0;
		String sql="delete from lmsBbs where num=? and bbsNum=?";
		conn=Connector.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, bbsNum);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			Connector.close(rs);
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return result;
	}
	
	
	public void insert(String title, String id){
		String sql="insert into lmsBbs(num,title,status,id,nalja,views) values(lmsBbs_2_seq.nextval,?,'미해결',?,sysdate,0)";
		conn=Connector.getConnection();
		try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, title);
				pstmt.setString(2, id);
				int result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			Connector.close(pstmt);
			Connector.close(conn);
		}
		
	}
	
		public int update(String sub, String content, int bbsNum, int num){
			int result=0;
			String sql="update lmsBbs set sub=?,content=? where num=? and bbsNum=?";
			conn=Connector.getConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, sub);
				pstmt.setString(2, content);
				pstmt.setInt(3, bbsNum);
				pstmt.setInt(4, num);
				result=pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				Connector.close(pstmt);
				Connector.close(conn);
			}
			return result;
		}

		//상위 5개 글 가져오기
	public ArrayList<BbsDto> precedenceList(int num,int bbsNum){
		ArrayList<BbsDto> list= new ArrayList<BbsDto>();
		
		String sql="select * from lmsbbs where lecnum=? and bbsNum=? and ROWNUM < 6 order by listnum desc";
		conn=Connector.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2,bbsNum);
			rs=pstmt.executeQuery();
			while(rs.next()){
				BbsDto bean = new BbsDto();
				bean.setTitle(rs.getString("title"));
				bean.setId(rs.getString("id"));
				bean.setNalja(rs.getDate("nalja"));
				
				
				list.add(bean);
			}
			
			
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
		
}

