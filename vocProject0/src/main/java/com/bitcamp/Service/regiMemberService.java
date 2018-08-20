package com.bitcamp.Service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.Dao.MemberInterfaceDao;
import com.bitcamp.Model.Member;

public class regiMemberService {
	
	@Autowired
	SqlSessionTemplate sqlsessionTemplate;
	MemberInterfaceDao dao;
	
	public int insertMember(Member member, HttpServletRequest request) throws IllegalStateException, IOException {
		
		dao = sqlsessionTemplate.getMapper(MemberInterfaceDao.class);
		int resultCnt = 0;
		
		String imgName = "";
		
		String uploadUri = "/file/photo";
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		System.out.println(dir);
		
		if(!member.getPhotoFile().isEmpty()) {
			imgName = member.getId() +"_"+ member.getPhotoFile().getOriginalFilename();
			member.getPhotoFile().transferTo(new File(dir, imgName));
			member.setPhoto(imgName);
		}
		
		resultCnt = dao.memberInsert(member);
		return resultCnt;
		
	}
	
	public int insertNoPhotoMember(Member member) {
		
		int resultCnt = 0;
		dao = sqlsessionTemplate.getMapper(MemberInterfaceDao.class);
		resultCnt = dao.memberInsert(member);
		return resultCnt;
	}
	
	
	public boolean idCheck(String id) {
		dao = sqlsessionTemplate.getMapper(MemberInterfaceDao.class);
		boolean result = false;
		Member member = null;
		
		member = dao.selectOneMember(id);
		
		if(member==null) {
			result = true;
		}
		
		return result;
	}
}
