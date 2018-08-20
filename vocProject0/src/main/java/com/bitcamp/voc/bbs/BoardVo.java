package com.bitcamp.voc.bbs;

import java.util.Date;

public class BoardVo {
	
	private int num;
	private String name;
	private String pw;
	private String title;
	private String memo;
	private Date regDate;
	private int viewCnt;
	private int replyCnt;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	@Override
	public String toString() {
		return "BoardVo [num=" + num + ", name=" + name + ", pw=" + pw + ", title=" + title + ", memo=" + memo
				+ ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", replyCnt=" + replyCnt + "]";
	}
}