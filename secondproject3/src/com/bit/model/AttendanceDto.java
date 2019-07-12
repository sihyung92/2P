package com.bit.model;

public class AttendanceDto {
	private int attendanceNum;
	private String date;
	private int type;
	private int lecNum;
	private int userNum;
	private int userKind;
	
	public int getAttendanceNum() {
		return attendanceNum;
	}
	public void setAttendanceNum(int attendanceNum) {
		this.attendanceNum = attendanceNum;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getLecNum() {
		return lecNum;
	}
	public void setLecNum(int lecNum) {
		this.lecNum = lecNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getUserKind() {
		return userKind;
	}
	public void setUserKind(int userKind) {
		this.userKind = userKind;
	}
	
	
}
