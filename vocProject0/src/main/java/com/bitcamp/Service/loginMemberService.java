package com.bitcamp.Service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.Dao.MemberInterfaceDao;
import com.bitcamp.Model.Member;

public class loginMemberService {
	
	@Autowired
	SqlSessionTemplate sqlsessionTemplate;
	MemberInterfaceDao dao;
	
	public int login(String id, String pwd) {
		
		dao = sqlsessionTemplate.getMapper(MemberInterfaceDao.class);
		int resultCnt = 0;
		
		Member member = dao.selectOneMember(id);
		
		if(member!= null) {
			if(member.getPwd()!=null) {
				if(member.getPwd().equals(pwd)) {
					resultCnt = 1;
				
				//2. 입력 비밀번호가 db 비밀번호와 같지 않다면
				}else {
					resultCnt = 2;
				}
			//3. 입력 비밀번호가 null 이라면	
			}else {
				resultCnt =3;
			}
		//0. 아이디가 틀렸거나 입력되지 않았다면	
		}else {
			resultCnt =0;
		}
		return resultCnt;
	}

}
