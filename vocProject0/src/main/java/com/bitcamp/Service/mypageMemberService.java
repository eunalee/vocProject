package com.bitcamp.Service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.Dao.MemberInterfaceDao;
import com.bitcamp.Model.Member;

public class mypageMemberService {
	
	@Autowired
	SqlSessionTemplate sqlsessionTemplate;
	MemberInterfaceDao dao;
	
	public Member selectOneMember(String id) {
		
		dao = sqlsessionTemplate.getMapper(MemberInterfaceDao.class);
		
		Member member = null;
		
		member = dao.selectOneMember(id);
		return member;
	}

}
