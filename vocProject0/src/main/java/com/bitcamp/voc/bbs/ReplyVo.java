package com.bitcamp.voc.bbs;

import java.util.Date;

public class ReplyVo {

	private int cnum;
	private String name;
	private Date regDate;
	private String memo;
	private int num;
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "ReplyVo [cnum=" + cnum + ", name=" + name + ", regDate=" + regDate + ", memo=" + memo + ", num=" + num
				+ "]";
	}
}
