package com.bitcamp.voc.bbs;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {

	@Autowired
	BoardDao boarddao;
	
	@Autowired
	ReplyDao replydao;
	
	// 메인 -> 게시판
	@RequestMapping(value="/bbs/board", method=RequestMethod.GET)
	public String board(@ModelAttribute("cri")Criteria cri, Model model) {
		
		/*Criteria cri = new Criteria();
		cri.setPage(page);
		cri.setPerPageNum(10);
		*/
		model.addAttribute("list", boarddao.listCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boarddao.countPaging(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		/*
		// 모든 게시물 조회
		model.addAttribute("list", boarddao.selectAll());
		*/
		return "bbs/board";
	}
	
	// 글 내용 클릭시 뷰
	@RequestMapping("/bbs/view")
	public String view(@RequestParam("num") int num, Model model) {

		// 조회수 1증가
		boarddao.viewCnt(num);
		
		// 선택된 게시물 조회
		model.addAttribute("list", boarddao.selectNum(num));
		
		// 선택된 게시물의 댓글 조회
		model.addAttribute("reply", replydao.selectAll(num));
		
		return "/bbs/view";
	}
	
	// 게시판 -> 글쓰기
	@RequestMapping(value="/bbs/write", method=RequestMethod.GET)
	public String writeG() {
		return "bbs/write";
	}
	
	@RequestMapping(value="/bbs/write", method=RequestMethod.POST)
	public String writeP(HttpServletRequest request, BoardVo info) {
		
		if((info.getMemo() != null && info.getMemo() != "")
				&& (info.getTitle() != null && info.getTitle() != "")) {
			// 세션을 받음
			String id = (String)request.getSession(true).getAttribute("id");
			info.setName(id);
			
			// 데이터 입력
			boarddao.insert(info);
		}
		
		return "redirect:board";
	}
	
	// 뷰 -> 글 삭제
	@RequestMapping("/bbs/delete")
	public String delete(HttpServletRequest request, @RequestParam("num") int num) {
		
		// 세션 아이디
		String id = (String)request.getSession(true).getAttribute("id");
		
		// 글 쓸때 db에 저장된 아이디
		String dbid = boarddao.selectName(num).getName();
		
		if(id.equals(dbid)) {
			// 댓글 전체 삭제
			replydao.deleteReply(num);
			
			// 데이터 삭제
			boarddao.delete(num);
		}
		
		return "redirect:board";
	}
	
	// 뷰 -> 글 수정
	@RequestMapping(value="/bbs/modify", method=RequestMethod.GET)
	public String modifyG(/*@RequestParam("num") int num, Model model*/) {
		/*model.addAttribute("num", num);*/
		return "/bbs/modify";
	}
	@RequestMapping(value="/bbs/modify", method=RequestMethod.POST)
	public String modifyP(
			@RequestParam("num") int num, 
			@RequestParam("title") String title, 
			@RequestParam("memo") String memo
			/*Model model*/) {
		
		if((title != null && title != "")&&(memo != null && memo != "")) {
			// 특정데이터 읽어옴
			BoardVo info = boarddao.selectNum(num);
	
			// 수정할 제목과 내용을 읽어온 데이터에 저장
			info.setTitle(title);
			info.setMemo(memo);
			
			// 수정할 객체를 쿼리로 넘겨 db 수정
			boarddao.modify(info);
		}
		return "redirect:board";
	}
	
	@RequestMapping("/bbs/selchk")
	public String selchk(
			@RequestParam("nums") int[] nums,
			HttpServletRequest request
			) {

		for(int i=0; i<nums.length; i++) {
			// 세션 아이디
			String id = (String)request.getSession(true).getAttribute("id");
			
			// 글 쓸때 db에 저장된 아이디
			String dbid = boarddao.selectName(nums[i]).getName();
			
			if(id.equals(dbid)) {
				// 댓글 전체 삭제
				replydao.deleteReply(nums[i]);
				
				// 데이터 삭제
				boarddao.delete(nums[i]);
			}
		}
		return "redirect:board";
	}
}
