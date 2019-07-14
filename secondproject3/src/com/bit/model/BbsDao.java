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
	
	//공지사항게시판
	public ArrayList<BbsDto> getNoticeList(){
		ArrayList<BbsDto> list=new ArrayList<BbsDto>();
		String sql="select * from lmsBbs where lecnum=1 and bbsNum=0 order by listnum desc";
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
	
	//자료게시판
		public ArrayList<BbsDto> getmaterialList(){
			ArrayList<BbsDto> list=new ArrayList<BbsDto>();
			String sql="select * from lmsBbs where lecNum=1 AND bbsNum=1 order by listnum desc";
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
	
	//과제게시판
	public ArrayList<BbsDto> getAssignmentList(){
		ArrayList<BbsDto> list=new ArrayList<BbsDto>();
		String sql="select * from lmsBbs where lecNum=1 AND bbsNum=2 order by listnum desc";
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

	//질문게시판
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
	//공지상세
	public BbsDto noticedetail(int listNum,int lecNum){
		BbsDto bean=new BbsDto();
		String sql="select * from lmsBbs where listNum=? and bbsNum=0 and lecNum=?";
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
	
	//자료상세
		public BbsDto materialdetail(int listNum,int lecNum){
			BbsDto bean=new BbsDto();
			String sql="select * from lmsBbs where listNum=? and bbsNum=1 and lecNum=?";
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
		
		//과제상세
				public BbsDto assignmentdetail(int listNum,int lecNum){
					BbsDto bean=new BbsDto();
					String sql="select * from lmsBbs where listNum=? and bbsNum=2 and lecNum=?";
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
	
	//질문상세
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

	//공지삭제
	public int noticeDelete(int lecNum,int listNum){
		int result=0;
		String sql="delete from lmsBbs where lecNum=? and bbsNum=0 and listNum=?";
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
	
	//자료삭제
	public int materialDelete(int lecNum,int listNum){
		int result=0;
		String sql="delete from lmsBbs where lecNum=? and bbsNum=1 and listNum=?";
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
	//과제삭제
	public int assignmentDelete(int lecNum,int listNum){
		int result=0;
		String sql="delete from lmsBbs where lecNum=? and bbsNum=2 and listNum=?";
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
	
	//질문삭제
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
	
	//공지등록
	public int noticeInsert(int lecNum,String title, String content,String id){
		String sql="insert into lmsBbs values(lmsBbs_0_seq.nextval,0,?,?,?,?,sysdate,0,null)";
		//lecNum,title,content,id
		int result=0;
		conn=Connector.getConnection();
		System.out.println("noticeInsert-lecNum : "+lecNum);
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
	//자료등록
	public int materialInsert(int lecNum,String title, String content,String id){
		String sql="insert into lmsBbs values(lmsBbs_1_seq.nextval,1,?,?,?,?,sysdate,0,null)";
		//lecNum,title,content,id
		int result=0;
		conn=Connector.getConnection();
		System.out.println("marterialInsert-lecNum : "+lecNum);
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
	
	//과제등록
	public int assignmentInsert(int lecNum,String title, String content,String id){
		String sql="insert into lmsBbs values(lmsBbs_2_seq.nextval,2,?,?,?,?,sysdate,0,null)";
		//lecNum,title,content,id
		int result=0;
		conn=Connector.getConnection();
		System.out.println("assignmentInsert-lecNum : "+lecNum);
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
	
	//질문등록
	public int questionInsert(int lecNum,String title, String content,String id){
		String sql="insert into lmsBbs values(lmsBbs_3_seq.nextval,3,?,?,?,?,sysdate,0,null)";
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



