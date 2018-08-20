package com.bitcamp.Model;

import java.util.List;

public class MemberListView {
	
	private int memberTotalCount;
	private List<Member> memberList;
	private int currentPageNumber;
	private int pageTotalCount;
	private int memberCountPerPage;
	
	private int firstRow;
	private int endRow;
	
	
	public MemberListView() {
		
	}
	
	public MemberListView(int memberTotalCount, List<Member> memberList, int currentPageNumber, int memberCountPerPage,
			int firstRow, int endRow) {
		super();
		this.memberTotalCount = memberTotalCount;
		this.memberList = memberList;
		this.currentPageNumber = currentPageNumber;
		this.memberCountPerPage = memberCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calculatePageTotalCount();
	}

	//member의 수에 맞춰 페이지 개수 설정 메서드
	private void calculatePageTotalCount() {
		 if(memberTotalCount == 0) {
			 pageTotalCount = 0;
		 }else {
			 pageTotalCount = memberTotalCount / memberCountPerPage;
			 
			 if(memberTotalCount % memberCountPerPage > 0) {
				 pageTotalCount++;
			 }
		 }
	}

	public int getMemberTotalCount() {
		return memberTotalCount;
	}

	public List<Member> getMemberList() {
		return memberList;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getMemberCountPerPage() {
		return memberCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}
	
	public boolean isEmpty() {
		return memberTotalCount == 0;
	}

	
	

}
