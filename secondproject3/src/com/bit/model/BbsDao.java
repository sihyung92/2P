package com.bit.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import com.bit.util.Connector;

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
		String sql="select * from lmsBbs where lecNum=1 AND bbsNum=3 order by listnum desc";
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

	public BbsDto questiondetail(int listNum,int lecNum){
		BbsDto bean=new BbsDto();
		String sql="select * from lmsBbs where listNum=? and bbsNum=3 and lecNum=?";
		conn=Connector.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,listNum);
			pstmt.setInt(2,lecNum);
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
	
	public int questionDelete(int lecNum,int listNum){
		int result=0;
		String sql="delete from lmsBbs where lecNum=? and bbsNum=3 and listNum=?";
		conn=Connector.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, lecNum);
			pstmt.setInt(2, listNum);
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
	
	
	public int questionInsert(int lecNum,String title, String content,String id){
		String sql="insert into lmsBbs values(lmsBbs_2_seq.nextval,3,?,?,?,?,sysdate,0,null)";
		//lecNum,title,content,id
		int result=0;
		conn=Connector.getConnection();
		System.out.println("questionInsert-lecNum : "+lecNum);
		try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, lecNum);
				pstmt.setString(2, title);
				pstmt.setString(3, content);
				pstmt.setString(4, id);
				result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			Connector.close(pstmt);
			Connector.close(conn);
		}
		return result;
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
		
}



