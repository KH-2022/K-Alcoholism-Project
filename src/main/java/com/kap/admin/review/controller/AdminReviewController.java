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
	
	@RequestMapping(value="/reply/pdReplyList", method = RequestMethod.GET)
	public String pdReplyList(@ModelAttribute("data") MemberVO mvo, ReplyVO rvo, Model model) {
		log.info("Admin pdReplyList 호출 성공");
		
		List<ReplyVO> pdReplyList = adminReviewService.pdReplyList(rvo);
		
		log.info("pdReplyList : " + pdReplyList);
		
		model.addAttribute("pdReplyList",pdReplyList);
		
		int pdCnt = adminReviewService.pdRelyListCnt(rvo);
		
		int total = pdCnt;
		model.addAttribute("pageMaker", new PageDTO(total, mvo));
		
		int count = total - (mvo.getPageNum()-1) * mvo.getAmount();
		model.addAttribute("count",count);
		
		return "admin/reply/pdReplyList";
	}
	
	@RequestMapping(value="/reply/brReplyList", method = RequestMethod.GET)
	public String brReplyList(@ModelAttribute("data") MemberVO mvo, BreplyVO bvo, Model model) {
		log.info("Admin brReplyList 호출 성공");
		
		List<BreplyVO> brReplyList = adminReviewService.brReplyList(bvo);
		
		log.info("brReplyList : " + brReplyList);
		
		model.addAttribute("brReplyList",brReplyList);
		
		int brCnt = adminReviewService.brRelyListCnt(bvo);
		
		int total = brCnt;
		model.addAttribute("pageMaker", new PageDTO(total, mvo));
		
		int count = total - (mvo.getPageNum()-1) * mvo.getAmount();
		model.addAttribute("count",count);
		
		return "admin/reply/brReplyList";
	}
	
	@RequestMapping(value="/reply/pdReplyDetail",method=RequestMethod.GET)
	public String pdReplyDetail(@ModelAttribute ReplyVO rvo, Model model) {
		log.info("admin pdReplyDetail 호출 성공");
		
		ReplyVO pdReplyDetail = adminReviewService.pdReplyDetail(rvo);
		model.addAttribute("detail",pdReplyDetail);
		
		return "admin/reply/pdReplyDetail";
	}
	
	@RequestMapping(value="/reply/pdReplyDelete",method=RequestMethod.POST)
	public String pdReviewDelete( ReplyVO rvo, RedirectAttributes ras) throws Exception {
		log.info("admin pdReplyDelete 호출 성공");
		
		adminReviewService.pdReplyDelete(rvo);
		ras.addFlashAttribute("sendMsg", "상품 리뷰가 삭제되었습니다.");
		
		return "redirect:/admin/reply/replyList";
	}
	
	@RequestMapping(value="/reply/brReplyDetail",method=RequestMethod.GET)
	public String brReplyDetail(@ModelAttribute BreplyVO bvo, Model model) {
		log.info("admin brReplyDetail 호출 성공");
		
		BreplyVO brReplyDetail = adminReviewService.brReplyDetail(bvo);
		model.addAttribute("detail",brReplyDetail);
		
		return "admin/reply/brReplyDetail";
	}
	
	@RequestMapping(value="/reply/brReplyDelete",method=RequestMethod.POST)
	public String brReviewDelete( BreplyVO bvo, RedirectAttributes ras) throws Exception {
		log.info("admin brReplyDelete 호출 성공");
		
		adminReviewService.brReplyDelete(bvo);
		ras.addFlashAttribute("sendMsg", "양조장 리뷰가 삭제되었습니다.");
		
		return "redirect:/admin/reply/replyList";
	}
	
}
