package com.bitcamp.Service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.Dao.MemberInterfaceDao;
import com.bitcamp.Model.Member;

public class editMemberService {
	
	@Autowired
	SqlSessionTemplate sqlsessionTemplate;
	MemberInterfaceDao dao;
	
	public boolean editMemberOne(HttpServletRequest request, Member member) throws IllegalStateException, IOException {
		
		dao = sqlsessionTemplate.getMapper(MemberInterfaceDao.class);
		boolean result = false;
		
		String imgName = "";
		
		String uploadUri = "/file/photo";
		String dir = request.getSession().getServletContext().getRealPath(uploadUri);
		System.out.println(dir);
		
		if(!member.getPhotoFile().isEmpty()) {
			imgName = member.getId() +"_"+ member.getPhotoFile().getOriginalFilename();
			member.getPhotoFile().transferTo(new File(dir, imgName));
			member.setPhoto(imgName);
		}
		
		System.out.println(member.getId());
		System.out.println(member.getName());
		
		if(dao.editMember(member)) {
			System.out.println(member.getId());
			System.out.println(member.getName());
			result = true;
		}
		
		return result;
	}

}
