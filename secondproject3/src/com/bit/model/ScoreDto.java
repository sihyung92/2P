package com.bit.model;

public class ScoreDto {
	private int scoreNum;
	private int lecNum;
	private int userNum;
	private int userKind;
	private String firstTest;
	private String secondTest;
	private String thirdTest;
	private String name;
	private String lecName;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLecName() {
		return lecName;
	}
	public void setLecName(String lecName) {
		this.lecName = lecName;
	}
	public int getScoreNum() {
		return scoreNum;
	}
	public void setScoreNum(int scoreNum) {
		this.scoreNum = scoreNum;
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
	public String getFirstTest() {
		return firstTest;
	}
	public void setFirstTest(String firstTest) {
		this.firstTest = firstTest;
	}
	public String getSecondTest() {
		return secondTest;
	}
	public void setSecondTest(String secondTest) {
		this.secondTest = secondTest;
	}
	public String getThirdTest() {
		return thirdTest;
	}
	public void setThirdTest(String thirdTest) {
		this.thirdTest = thirdTest;
	}
}
