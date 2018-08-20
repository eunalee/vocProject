package com.bitcamp.Service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.Dao.MemberInterfaceDao;

public class deleteMemberService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	MemberInterfaceDao dao;
	
	public boolean deleteMember(String id) {
		
		dao = sqlSessionTemplate.getMapper(MemberInterfaceDao.class);
		boolean result = false;
		
		if(dao.deleteMember(id)) {
			result = true;
		}
		
		return result;

	}
}
