package com.bitcamp.Service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.bitcamp.Dao.MemberInterfaceDao;
import com.bitcamp.Model.Member;

public class MailingService {
	
	@Autowired
	JavaMailSender mailSender;

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	MemberInterfaceDao dao;

	public void sendRegiAlertMail(String id) throws MessagingException, UnsupportedEncodingException {
		
		Member member = null;
		dao = sqlSessionTemplate.getMapper(MemberInterfaceDao.class);
		member = dao.selectOneMember(id);
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
		
		String html="<h2>"+id+"님, VOC 쇼핑몰 회원가입을 진심으로 감사 드립니다</h2><br>"
				+ member.getName() +"님 의 회원 가입 정보는 아래와 같습니다<br><br>"
				+ "회원 아이디: " + id+ "<br>"
				+ "회원 이름: " + member.getName() + "<br><br>"
				+ "<a href=\'http://localhost/voc/'>홈페이지</a>를 방문하시면 회원정보를 수정할 수 있습니다. <br>";
		
		messageHelper.setSubject("[안내]" + member.getName() +  "님 회원가입을 축하드립니다!");
		messageHelper.setText(html, true);
		messageHelper.setFrom("ryuinhye9501@gmail.com", "쇼핑몰 VOC");
		messageHelper.setTo(new InternetAddress(member.getEmail() , member.getName(), "utf-8"));
		
		mailSender.send(message);
		System.out.println("발송완료");
	}
	
}
