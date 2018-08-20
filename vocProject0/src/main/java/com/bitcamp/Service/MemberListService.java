package com.bitcamp.Service;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.Dao.MemberInterfaceDao;
import com.bitcamp.Model.Member;
import com.bitcamp.Model.MemberListView;

public class MemberListService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	MemberInterfaceDao dao;
	
	int memberTotalCount = 0;
	private static final int MEMBER_COUNT_PER_PAGE = 10;
	
	public MemberListView getMemberList(int pageNumber) {
		dao = sqlSessionTemplate.getMapper(MemberInterfaceDao.class);
		MemberListView memberListView = null;
		
		int currentPageNumber = 1;
		
		if(pageNumber > 0) {
			currentPageNumber = pageNumber;
		}
		
		memberTotalCount = dao.selectMemberCount();
		
		List<Member> memberList = null;
		int firstRow = 0;
		int endRow = 0;
		
		if(memberTotalCount > 0) {
			
			firstRow = (currentPageNumber -1)* MEMBER_COUNT_PER_PAGE;
			endRow = firstRow + MEMBER_COUNT_PER_PAGE - 1;
			memberList = dao.selectMemberListPage(firstRow, endRow);
		}else {
			currentPageNumber = 0;
			memberList = Collections.emptyList();
		}
		
		memberListView = new MemberListView(memberTotalCount, memberList, currentPageNumber, MEMBER_COUNT_PER_PAGE,
				firstRow, endRow);

		return memberListView;
	}

}
