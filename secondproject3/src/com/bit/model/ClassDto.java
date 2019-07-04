package com.bit.model;

import java.sql.Date;

public class ClassDto {
	
	private int codeNum;
	private int classNum;
	private String teacherName;
	private Date nalja;
	private int stuNum;
	private String content;
	private int roomNum;
	
	
	public int getCodeNum() {
		return codeNum;
	}
	public void setCodeNum(int codeNum) {
		this.codeNum = codeNum;
	}
	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public Date getNalja() {
		return nalja;
	}
	public void setNalja(Date nalja) {
		this.nalja = nalja;
	}
	public int getStuNum() {
		return stuNum;
	}
	public void setStuNum(int stuNum) {
		this.stuNum = stuNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	
	
}
