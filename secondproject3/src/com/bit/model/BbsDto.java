package com.bit.model;

import java.sql.Date;

public class BbsDto{
	private int listNum; //00 ����, 01�����ڷ�, 02����,03����
	private int bbsNum;	 //���ǹ�ȣ
	private int num;	//�Խ��ǹ�ȣ
	private String title;	//����
	private String content; //����
	private String id;	//�л�
	private Date nalja;	//�����
	private int views;	//��ȸ��
	private String attach;	//÷��
	private String status;	//�亯����
	
	
	public int getBbsNum() {
		return bbsNum;
	}
	public void setBbsNum(int bbsNum) {
		this.bbsNum = bbsNum;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getNalja() {
		return nalja;
	}
	public void setNalja(Date nalja) {
		this.nalja = nalja;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getAttach() {
		return attach;
	}
	public void setAttach(String attach) {
		this.attach = attach;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}
