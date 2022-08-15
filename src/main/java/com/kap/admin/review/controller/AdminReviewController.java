package com.kap.admin.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.review.service.AdminReviewService;
import com.kap.admin.member.vo.MemberVO;
import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;
import com.kap.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value="/admin/*")
@AllArgsConstructor
public class AdminReviewController {
	private  AdminReviewService adminReviewService;
	
	@RequestMapping(value="/reply/replyList", method = RequestMethod.GET)
	public String replyList(@ModelAttribute("data") MemberVO mvo, ReplyVO rvo, BreplyVO bvo, Model model) {
		log.info("AdminReplyList 호출성공");
		
		List<ReplyVO> pdReplyList = adminReviewService.pdReplyList(rvo);
		List<BreplyVO> brReplyList = adminReviewService.brReplyList(bvo);
		
		log.info("pdReplyList : " + pdReplyList);
		log.info("brReplyList : " + brReplyList);
		
		model.addAttribute("pdReplyList",pdReplyList);
		model.addAttribute("brReplyList",brReplyList);
		
		int pdCnt = adminReviewService.pdRelyListCnt(rvo);
		int brCnt = adminReviewService.brRelyListCnt(bvo);
		
		int total = pdCnt + brCnt;
		model.addAttribute("pageMaker", new PageDTO(total, mvo));
		
		int count = total - (mvo.getPageNum()-1) * mvo.getAmount();
		model.addAttribute("count",count);
		
		return "admin/reply/replyList";
	}
	
	@RequestMapping(value="/reply/pdReplyDetail",method=RequestMethod.GET)
	public String pdReplyDetail(@ModelAttribute ReplyVO rvo, Model model) {
		log.info("admin pdReplyDetail 호출성공");
		
		ReplyVO pdReplyDetail = adminReviewService.pdReplyDetail(rvo);
		model.addAttribute("detail",pdReplyDetail);
		
		return "admin/reply/pdReplyDetail";
	}
	
	@RequestMapping(value="/reply/pdReplyDelete",method=RequestMethod.POST)
	public String pdReviewDelete( ReplyVO rvo, RedirectAttributes ras) throws Exception {
		log.info("admin pdReplyDelete 호출성공");
		
		adminReviewService.pdReplyDelete(rvo);
		ras.addFlashAttribute("sendMsg", "상품 댓글이 삭제 되었습니다.");
		
		return "redirect:/admin/reply/replyList";
	}
	
	@RequestMapping(value="/reply/brReplyDetail",method=RequestMethod.GET)
	public String brReplyDetail(@ModelAttribute BreplyVO bvo, Model model) {
		log.info("admin brReplyDetail 호출성공");
		
		BreplyVO brReplyDetail = adminReviewService.brReplyDetail(bvo);
		model.addAttribute("detail",brReplyDetail);
		
		return "admin/reply/brReplyDetail";
	}
	
	@RequestMapping(value="/reply/brReplyDelete",method=RequestMethod.POST)
	public String brReviewDelete( BreplyVO bvo, RedirectAttributes ras) throws Exception {
		log.info("admin brReplyDelete 호출성공");
		
		adminReviewService.brReplyDelete(bvo);
		ras.addFlashAttribute("sendMsg", "양조장 댓글이 삭제 되었습니다.");
		
		return "redirect:/admin/reply/replyList";
	}
	
}
