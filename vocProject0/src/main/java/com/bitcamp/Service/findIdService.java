package com.bitcamp.Service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.Dao.MemberInterfaceDao;
import com.bitcamp.Model.Member;

public class findIdService {
	
	@Autowired
	SqlSessionTemplate sqlsessionTemplate;
	MemberInterfaceDao dao;
	
	public Member findId(String name, String pwd, String phone, String email) {
		int resultCnt = 0;
		Member Tmpmember = null;
		Member member = null;
		dao = sqlsessionTemplate.getMapper(MemberInterfaceDao.class);
		
		Tmpmember = dao.selectOneMemberByName(name);
		
		if(Tmpmember!=null) {
			if(Tmpmember.getPwd().equals(pwd)) {
				if(Tmpmember.getPhone().equals(phone)) {
					if(Tmpmember.getEmail().equals(email)) {
						member = dao.selectOneMemberByName(name);
					}
				}
			}
		}
		
		return member;
	}

}
