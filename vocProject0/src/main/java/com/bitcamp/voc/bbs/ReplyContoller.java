package com.bitcamp.voc.bbs;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReplyContoller {
	
	@Autowired
	BoardDao boarddao;
	
	@Autowired
	ReplyDao replydao;

	//댓글 입력
	@RequestMapping("/bbs/replyinsert")
	public String Rwrite(
			/*@RequestParam("name") String name,*/
			HttpServletRequest request,
			@RequestParam("memo") String memo,
			@RequestParam("num") int num,
			Model model
			) {
		
		if(memo != null && memo != "") {
			String id = (String)request.getSession(true).getAttribute("id");
			
			// 객체에 파라미터값을 입력
			ReplyVo info = new ReplyVo();
			info.setName(id);
			info.setMemo(memo);
			info.setNum(num);
			
			// 객체를 db로 입력
			replydao.insert(info);
			
			// 댓글 개수 +1
			boarddao.replyCntP(num);
		}
		
		// view로 이동시 필요한 num을 넘겨줌
		model.addAttribute("num", num);
		
		return "redirect:view";
	}
	
	// 댓글 삭제
	@RequestMapping("/bbs/replydelete")
	public String Rdelete(
			@RequestParam("cnum") int cnum, 
			@RequestParam("num") int num,
			HttpServletRequest request,
			Model model
			) {

		String id = (String)request.getSession(true).getAttribute("id");
		
		String dbid = replydao.selectName(cnum).getName();
		
		if(id.equals(dbid)) {
			// cnum 번호 댓글을 삭제
			replydao.delete(cnum);
			
			// 댓글 개수 +1
			boarddao.replyCntM(num);
		}
		
		// view로 이동시 필요한 num을 넘겨줌
		model.addAttribute("num", num);
		
		return "redirect:view";
	}
	
	// 댓글 수정
	@RequestMapping("/bbs/replymodify")
	public String Rmodify(
			@RequestParam("mcnum") int cnum,
			@RequestParam("mnum") int num,
			@RequestParam("mmemo") String memo,
			Model model
			) {
		
		if(memo != null && memo != "") {
			// 특정한 데이터를 받아와서 객체로 넘김
			ReplyVo info = replydao.selectNum(cnum);
			
			// 수정할 메모를 객체에 수정
			info.setMemo(memo);
			
			// 수정한 댓글 객체를 db로 보내 수정
			replydao.modify(info);
		}
		
		// view로 이동시 필요한 num을 넘겨줌
		model.addAttribute("num", num);
		
		return "redirect:view";
	}
}
