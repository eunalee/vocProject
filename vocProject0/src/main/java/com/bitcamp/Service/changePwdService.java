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


public class changePwdService {

	@Autowired
	SqlSessionTemplate sqlsessionTemplate;
	MemberInterfaceDao dao;
	
	@Autowired
	JavaMailSender mailSender;

	// 본격 비밀번호 변경
	public boolean changePwd(String id, String prePw, String pwd) throws UnsupportedEncodingException {

		dao = sqlsessionTemplate.getMapper(MemberInterfaceDao.class);
		Member member = null;

		boolean result = false;

		// id로 데이터 받아옴
		member = dao.selectOneMember(id);

		if (member != null) {
			if (member.getPwd().equals(prePw)) {
				member.setPwd(pwd);
				dao.updatePwd(id, pwd);
				result = true;
			}
		}
		return result;
	}

	// 임시 비밀번호 생성
	public int makeTmpPwd(String id, String name, String email)
			throws MessagingException, UnsupportedEncodingException {

		int resultCnt = 0;
		Member member;
		dao = sqlsessionTemplate.getMapper(MemberInterfaceDao.class);

		// id로 데이터 받아옴
		member = dao.selectOneMember(id);
		System.out.println(member.getName());
		System.out.println(name);
		if (member != null) {
			if (member.getName().equals(name)) {	
				if (member.getEmail().equals(email)) {

					// 임시 비밀번호 생성
					String pwd = "";
					for (int i = 0; i < 12; i++) {
						pwd += (char) ((Math.random() * 26) + 97);
					}

					member.setPwd(pwd);
					System.out.println(member.getPwd());
					dao.updatePwd(id, pwd);

					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

					String html = "<h2>" + id + "님의 임시 비밀번호 입니다.</h2><br>" + "회원 아이디: " + member.getId() + "<br>"
							+ "회원 이름: " + member.getName() + "<br>" + "<b>임시 비밀번호: " + member.getPwd() + "</b><br><br>"
							+ "빠른 시일 안에 비밀번호를 변경해주세요!<br>"
							+ "<a href=\'http://localhost/voc/member/login'>로그인 하러가기</a><br>";

					messageHelper.setSubject("[긴급]" + member.getName() + "님의 임시 비밀번호 입니다.");
					messageHelper.setText(html, true);
					messageHelper.setFrom("ryuinhye9501@gmail.com", "쇼핑몰 VOC");
					messageHelper.setTo(new InternetAddress(member.getEmail(), member.getName(), "utf-8"));

					mailSender.send(message);

					resultCnt = 1;

				} else {
					resultCnt = 4;
				}
			} else {
				resultCnt = 2;
			}

		} else {
			resultCnt = 0;
		}

		return resultCnt;

	}

}
