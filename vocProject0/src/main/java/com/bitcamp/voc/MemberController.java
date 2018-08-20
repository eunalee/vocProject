package com.bitcamp.voc;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.Model.Member;
import com.bitcamp.Model.MemberListView;
import com.bitcamp.NaverLogin.JsonStringParse;
import com.bitcamp.NaverLogin.NaverLoginBO;
import com.bitcamp.Service.MailingService;
import com.bitcamp.Service.MemberListService;
import com.bitcamp.Service.changePwdService;
import com.bitcamp.Service.deleteMemberService;
import com.bitcamp.Service.editMemberService;
import com.bitcamp.Service.findIdService;
import com.bitcamp.Service.loginMemberService;
import com.bitcamp.Service.mypageMemberService;
import com.bitcamp.Service.regiMemberService;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class MemberController {

	@Autowired
	regiMemberService regiMemberService;

	@Autowired
	loginMemberService loginMemberService;

	@Autowired
	mypageMemberService mypageMemberService;

	@Autowired
	MemberListService MemberListService;

	@Autowired
	deleteMemberService deleteMemberService;

	@Autowired
	editMemberService editMemberService;

	@Autowired
	changePwdService changePwdService;

	@Autowired
	MailingService mailingService;

	@Autowired
	findIdService findIdService;
	
	@Autowired
	JsonStringParse jsonStringParse;

	// 네이버 로그인
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 회원가입 폼 메서드
	@RequestMapping(value = "/member/regi", method = RequestMethod.GET)
	public String getRegiForm() {
		return "member/RegiForm";
	}

	// 회원가입하는 메서드
	@RequestMapping(value = "/member/regi", method = RequestMethod.POST)
	public String actRegi(HttpServletRequest request, Member member, Model model)
			throws IllegalStateException, IOException, MessagingException {

		int resultCnt = 0;
		resultCnt = regiMemberService.insertMember(member, request);
		model.addAttribute("resultCnt", resultCnt);

		if (resultCnt == 1) {
			mailingService.sendRegiAlertMail(member.getId());
		}
		return "member/RegiAct";
	}

	// id 중복확인
	@RequestMapping(value = "/member/idcheck/{id}", method = RequestMethod.GET)
	public String actIdCheck(@PathVariable("id") String id, Model model) {
		boolean result = false;

		result = regiMemberService.idCheck(id);
		model.addAttribute("result", result);
		model.addAttribute("id", id);

		return "member/idcheck";
	}

	// id 중복확인
	@RequestMapping(value = "/member/idcheck/", method = RequestMethod.POST)
	public String actEmptyIdCheck(@RequestParam("id") String id, Model model) {
		boolean result = false;

		result = regiMemberService.idCheck(id);
		model.addAttribute("result", result);
		model.addAttribute("id", id);

		return "member/idcheck";
	}

	// Login폼 메서드
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String getLoginForm(Model model, HttpSession session) {

		/* 네이버 아이디로 인증 URL을 생성하기 위하여 naverLoginBO 클래스의 getAuthorizationUrl 메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUri(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버: " + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		// 생성한 인증 URL을 View로 전달*/

		return "member/loginForm";
	}

	// 일반 로그인 처리 메서드
	@RequestMapping(value = "/member/login", method = RequestMethod.POST)
	public String actLogin(@RequestParam("id") String id, @RequestParam("pwd") String pwd, Model model) {
		int resultCnt = 0;

		resultCnt = loginMemberService.login(id, pwd);
		model.addAttribute("resultCnt", resultCnt);
		model.addAttribute("id", id);

		return "member/loginAct";
	}

	// 네이버 로그인 처리 메서드 : 네이버 로그인 성공 시 callback 호출 메소드
	@RequestMapping(value = "/member/naverCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request, Member member)
			throws IOException, ParseException, MessagingException {

		int resultCnt = 0;
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
		model.addAttribute("result", apiResult);
		System.out.println("result" + apiResult);
		
		//DB와 세션에 넣기
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject)jsonParser.parse(naverLoginBO.getUserProfile(oauthToken).toString());
		
		JSONObject response = (JSONObject)jsonObject.get("response");
		
		System.out.println("이것은" + jsonObject.get("response"));
		System.out.println("아이디는" + (String)response.get("id"));
		
		member.setId((String)response.get("id"));
		member.setPwd("0000");
		member.setName((String) response.get("name"));
		member.setEmail((String) response.get("email"));
		member.setGender((String)response.get("gender"));
		/*member.setBirth((String) response.get("birthday"));*/
		
		System.out.println("멤바아이디는 " + member.getId());
		
		if(mypageMemberService.selectOneMember((String)response.get("id")) == null) {
			resultCnt = regiMemberService.insertNoPhotoMember(member);
	
				if (resultCnt == 1) {
					mailingService.sendRegiAlertMail(member.getId());
				}
		}
		request.getSession(true).setAttribute("id", member.getId());

		return "member/naverSuccess";

	}

	// logout
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession(false).invalidate();
		return "redirect:/";
	}

	// Mypage 메서드
	@RequestMapping(value = "/member/myPage", method = RequestMethod.GET, produces = "text/plain; charset=UTF-8")
	public String getMyPage(HttpServletRequest request, Member member) {

		String id = (String) request.getSession(true).getAttribute("id");

		if (id != null) {

			member.setId(mypageMemberService.selectOneMember(id).getId());
			member.setPwd(mypageMemberService.selectOneMember(id).getPwd());
			member.setName(mypageMemberService.selectOneMember(id).getName());
			member.setBirth(mypageMemberService.selectOneMember(id).getBirth());
			member.setGender(mypageMemberService.selectOneMember(id).getGender());
			member.setEmail(mypageMemberService.selectOneMember(id).getEmail());
			member.setPhone(mypageMemberService.selectOneMember(id).getPhone());
			member.setAddress(mypageMemberService.selectOneMember(id).getAddress());
			member.setPhoto(mypageMemberService.selectOneMember(id).getPhoto());
			member.setJoindate(mypageMemberService.selectOneMember(id).getJoindate());
		}
		return "member/myPage";
	}

	// MemberList 메서드
	@RequestMapping(value = "/member/memberList", method = RequestMethod.GET)
	public String getMemberList(MemberListView memberListView, Model model) {

		int pageNumber = 1;

		model.addAttribute("memberListView", MemberListService.getMemberList(pageNumber));

		return "member/memberList";
	}

	// MemberList 메서드
	@RequestMapping(value = "/member/memberList/{page}", method = RequestMethod.GET)
	public String getMemberListPage(@PathVariable("page") String pageNumberStr, MemberListView memberListView,
			Model model) {

		int pageNumber = 1;

		if (pageNumberStr != null) {
			pageNumber = Integer.parseInt(pageNumberStr);
		}

		model.addAttribute("memberListView", MemberListService.getMemberList(pageNumber));

		return "member/memberList";
	}

	// 멤버 삭제 메서드
	@RequestMapping(value = "/member/deleteMember/{id}", method = RequestMethod.GET)
	public String deleteMemberOne(@PathVariable("id") String Deleteid, HttpServletRequest request, Model model) {

		String id = (String) request.getSession(true).getAttribute("id");

		model.addAttribute("result", deleteMemberService.deleteMember(Deleteid));

		return "member/deleteMemberAct";
	}

	// 멤버 수정 폼 메서드
	@RequestMapping(value = "/member/editMember", method = RequestMethod.GET)
	public String getEditMemberForm(HttpServletRequest request, Model model) {

		String id = (String) request.getSession(true).getAttribute("id");
		Member member = mypageMemberService.selectOneMember(id);

		model.addAttribute("member", member);

		return "member/editMemberForm";
	}

	// 멤버 수정 메서드
	@RequestMapping(value = "/member/editMember", method = RequestMethod.POST)
	public String actEditMember(HttpServletRequest request, Member member, Model model)
			throws IllegalStateException, IOException {

		boolean result = false;

		result = editMemberService.editMemberOne(request, member);
		model.addAttribute("result", result);

		return "member/editMemberAct";
	}

	// 비밀번호 변경 폼으로 전송 메서드
	@RequestMapping(value = "/member/changePwd", method = RequestMethod.GET)
	public String getChangePwdForm() {
		return "member/changePwdForm";
	}

	// 본격 비밀번호를 변경해주는 메서드
	@RequestMapping(value = "/member/changePwd", method = RequestMethod.POST)
	public String changePassword(HttpServletRequest request, @RequestParam("prePw") String prePw,
			@RequestParam("pwd") String pwd, Model model) throws UnsupportedEncodingException {

		boolean result = false;
		String id = (String) request.getSession(true).getAttribute("id");
		result = changePwdService.changePwd(id, prePw, pwd);

		model.addAttribute("result", result);

		return "member/changePwdAct";
	}

	// 비밀번호 찾기 폼으로 보내주는 메서드
	@RequestMapping(value = "/member/pwd/FindTempPwd", method = RequestMethod.GET)
	public String getFindPwdForm() {
		return "member/findPwdForm";
	}

	// 임시 비밀번호 메일로 발송하는 메서드
	@RequestMapping(value = "/member/pwd/FindTempPwd", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String findPwdAct(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("email") String email, Model model) throws UnsupportedEncodingException, MessagingException {

		int resultCnt = changePwdService.makeTmpPwd(id, name, email);
		model.addAttribute("resultCnt", resultCnt);

		return "member/findPwdAct";
	}

	// 아이디 찾기 폼으로 보내주는 메서드
	@RequestMapping(value = "/member/id/FindId", method = RequestMethod.GET)
	public String getFindIdForm() {
		return "member/findIdForm";
	}

	// 아이디 찾아주는 메서드
	@RequestMapping(value = "/member/id/FindId", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String findIdAct(@RequestParam("name") String name, @RequestParam("pwd") String pwd,
			@RequestParam("phone") String phone, @RequestParam("email") String email, Model model) {

		if (findIdService.findId(name, pwd, phone, email) != null) {
			model.addAttribute("id", findIdService.findId(name, pwd, phone, email).getId());
		}
		model.addAttribute("name", name);

		return "member/findIdAct";
	}

}
