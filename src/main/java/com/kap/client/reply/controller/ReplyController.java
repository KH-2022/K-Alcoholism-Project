package com.kap.client.reply.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.brewery.vo.BreweryVO;
import com.kap.client.myPage.vo.MyPageOrderVO;
import com.kap.client.reply.service.ReplyService;
import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;
import com.kap.client.reserve.vo.ReserveVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/reply")
@Log4j
@RequiredArgsConstructor
public class ReplyController {
	private final ReplyService replyService;
	
	@RequestMapping(value="/reply", method = RequestMethod.GET)
	public String review(@SessionAttribute("login") MemberVO loginMember, MyPageOrderVO ovo, ReserveVO rvo, Model model) {
		model.addAttribute(loginMember);
		rvo.setUser_no(loginMember.getUser_no());
		ovo.setUser_no(loginMember.getUser_no());
		
		List<ReserveVO> reserveManage = replyService.reserveManage(rvo);
		model.addAttribute("reserveManage",reserveManage);
		
		List<MyPageOrderVO> orderManage = replyService.orderManage(ovo);
		model.addAttribute("orderManage",orderManage);
		log.info("orderManage : "+orderManage);
		
		return "client/reply";
	}
	
	@RequestMapping(value="/pdReplyForm", method = RequestMethod.GET)
	public String pdReviewForm(@SessionAttribute("login") MemberVO loginMember, MyPageOrderVO ovo, Model model) {
		model.addAttribute(loginMember);
		ovo.setUser_no(loginMember.getUser_no());
		
		MyPageOrderVO pdReplyForm = replyService.pdReplyForm(ovo);
		model.addAttribute("pdReplyForm", pdReplyForm);
		
		return "client/pdReplyForm";
	}
	@RequestMapping(value="/brReplyForm", method = RequestMethod.GET)
	public String brReviewForm(@RequestParam(required=false, value="br_id")Integer br_id, @SessionAttribute("login") MemberVO loginMember, BreweryVO bvo, ReserveVO rvo, Model model) {
		model.addAttribute(loginMember);
		rvo.setUser_no(loginMember.getUser_no());
		
		BreweryVO brReplyForm = replyService.brReplyForm(bvo);
		model.addAttribute("brReplyForm", brReplyForm);
		model.addAttribute("reserve",rvo);
		
		log.info("brReplyForm = " + brReplyForm);
		
		return "client/brReplyForm";
	}
	
	@RequestMapping(value = "/replyList", method=RequestMethod.GET)
	public String replyList(@SessionAttribute("login") MemberVO loginMember, ReplyVO rvo, BreplyVO bvo, Model model){
		log.info("replyList 호출 성공");
		
		model.addAttribute(loginMember);
		rvo.setUser_no(loginMember.getUser_no());
		bvo.setUser_no(loginMember.getUser_no());
		
		List<ReplyVO> pdReplyList = replyService.replyList(rvo);
		List<BreplyVO> brReplyList = replyService.reserveList(bvo);
		
		model.addAttribute("pdReplyList", pdReplyList);
		model.addAttribute("brReplyList", brReplyList);
		
		log.info("pdReplyList : " + pdReplyList);
		log.info("brReplyList : " + brReplyList);
		
		return "client/replyList";
	}
	
	@RequestMapping(value = "/replyInsert", method = RequestMethod.POST)
	public String replyInsert(@SessionAttribute("login") MemberVO loginMember, MyPageOrderVO ovo, ReplyVO rvo, Model model) throws Exception {
		log.info("replyInsert 호출 성공");
		
		model.addAttribute(loginMember);
		rvo.setUser_no(loginMember.getUser_no());
		ovo.setUser_no(loginMember.getUser_no());
		
		replyService.replyInsert(rvo);
		replyService.orderdetailUpdate(ovo);
		
		return "redirect:/reply/reply";
	}
	
	@RequestMapping(value = "/bReplyInsert", method = RequestMethod.POST)
	public String bReplyInsert(@SessionAttribute("login") MemberVO loginMember, @RequestParam(required=false, value="rsv_no")Integer rsv_no, BreplyVO vvo, ReserveVO rvo, Model model) throws Exception {
		log.info("bReplyInsert 호출 성공");
		
		model.addAttribute(loginMember);
		vvo.setUser_no(loginMember.getUser_no());
		
		replyService.bReplyInsert(vvo);
		replyService.reserveUpdate(rvo);
		
		return "redirect:/reply/reply";
	}
	
	@RequestMapping(value = "/replyUpdateForm")
	public String updateForm(@ModelAttribute("replyData")ReplyVO rvo, Model model) {
		log.info("replyUpdateForm 호출 성공");
		
		ReplyVO updateReply = replyService.replyUpdateForm(rvo);
		model.addAttribute("updateReply", updateReply);
		
		log.info("updateReply : " + updateReply);
		return "client/replyUpdateForm";
	}
	
	@RequestMapping(value = "/bReplyUpdateForm")
	public String bReplyUpdateForm(@ModelAttribute("bReplyData") BreplyVO bvo, Model model) {
		log.info("BreplyUpdateForm 호출 성공");
		
		BreplyVO updateBreply = replyService.bReplyUpdateForm(bvo);
		model.addAttribute("bReplyUpdate", updateBreply);
		
		log.info("bUpdateReply : " + updateBreply);
		return "client/bReplyUpdateForm";
		
	}
	
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(@SessionAttribute("login") MemberVO loginMember, ReplyVO rvo, BreplyVO bvo, Model model, RedirectAttributes ras) throws Exception {
		log.info("replyUpdate 호출 성공");
		
		model.addAttribute(loginMember);
		
		rvo.setUser_no(loginMember.getUser_no());
		bvo.setUser_no(loginMember.getUser_no());
		
		replyService.replyUpdate(rvo);
		ras.addFlashAttribute("replyData", rvo);
		ras.addFlashAttribute("updateMsg", "리뷰를 수정하였습니다.");
		
		return "redirect:/reply/replyList";
	}
	
	@RequestMapping(value = "/bReplyUpdate", method = RequestMethod.POST)
	public String bReplyUpdate(@SessionAttribute("login") MemberVO loginMember, ReplyVO rvo, BreplyVO bvo, Model model, RedirectAttributes ras) throws Exception {
		log.info("bReplyUpdate 호출 성공");
		
		model.addAttribute(loginMember);
		
		rvo.setUser_no(loginMember.getUser_no());
		bvo.setUser_no(loginMember.getUser_no());
		
		replyService.bReplyUpdate(bvo);
		ras.addFlashAttribute("bReplyData", rvo);
		ras.addFlashAttribute("updateMsg", "리뷰를 수정하였습니다.");
		
		return "redirect:/reply/replyList";
	}

	@RequestMapping(value = "/replyDelete")
	public String replyDelete(@SessionAttribute("login") MemberVO loginMember, ReplyVO rvo, BreplyVO bvo, Model model, RedirectAttributes ras) throws Exception {
		log.info("replyDelete 호출 성공");
		
		model.addAttribute(loginMember);
		
		rvo.setUser_no(loginMember.getUser_no());
		bvo.setUser_no(loginMember.getUser_no());
		
		replyService.replyDelete(rvo);
		ras.addFlashAttribute("updateMsg", "상품 리뷰를 삭제하였습니다.");
		
		return "redirect:/reply/replyList";
	}
	
	@RequestMapping(value = "/bReplyDelete")
	public String bReplyDelete(@SessionAttribute("login") MemberVO loginMember, ReplyVO rvo, BreplyVO bvo, Model model, RedirectAttributes ras) throws Exception {
		log.info("bReplyDelete 호출 성공");
		
		model.addAttribute(loginMember);
		
		rvo.setUser_no(loginMember.getUser_no());
		bvo.setUser_no(loginMember.getUser_no());
		
		replyService.bReplyDelete(bvo);
		ras.addFlashAttribute("updateMsg", "양조장 체험 리뷰를 삭제하였습니다.");
		
		return "redirect:/reply/replyList";
	}
	
	
}