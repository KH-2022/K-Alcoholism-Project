package com.kap.client.reply.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.client.login.vo.LoginVO;
import com.kap.client.reply.service.ReplyService;
import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;
import com.kap.client.signUp.vo.SignUpVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/reply")
@Log4j
@RequiredArgsConstructor
public class ReplyController {
	private final ReplyService replyService;
	
	
	@RequestMapping(value="/reply", method = RequestMethod.GET)
	public String review(@SessionAttribute("login") LoginVO loginMember, SignUpVO svo, Model model) {
		
		model.addAttribute("login");
		return "client/reply";
	}
	
	@RequestMapping(value="/replyForm", method = RequestMethod.GET)
	public String reviewForm(@SessionAttribute("login") LoginVO loginMember, SignUpVO svo, Model model) {
		
		model.addAttribute("login");
		return "client/replyForm";
	}
	
	@RequestMapping(value = "/replyList", method=RequestMethod.GET)
	public String replyList(@SessionAttribute("login") LoginVO loginMember, ReplyVO rvo, BreplyVO vvo, Model model){
		log.info("replyList 호출 성공");
		
		model.addAttribute(loginMember);
		
		rvo.setUser_no(loginMember.getUser_no());
		vvo.setUser_no(loginMember.getUser_no());
		
		List<ReplyVO> replyList = replyService.replyList(rvo);
		List<BreplyVO> reserveList = replyService.reserveList(vvo);
		
		model.addAttribute("replyList", replyList);
		model.addAttribute("reserveList", reserveList);
		
		log.info("replyList : " + replyList);
		log.info("reserveList : " + reserveList);
		
		return "client/replyList";
	}
	
	@RequestMapping(value = "/replyInsert", method = RequestMethod.POST)
	public String replyInsert(@SessionAttribute("login") LoginVO loginMember, ReplyVO rvo, Model model) throws Exception {
		log.info("replyInsert 호출 성공");
		
		model.addAttribute(loginMember);
		rvo.setUser_no(loginMember.getUser_no());
		
		replyService.replyInsert(rvo);
		
		return "client/reply";
	}
	
	@RequestMapping(value = "/bReplyInsert", method = RequestMethod.POST)
	public String bReplyInsert(@SessionAttribute("login") LoginVO loginMember, BreplyVO vvo, Model model) throws Exception {
		log.info("bReplyInsert 호출 성공");
		
		model.addAttribute(loginMember);
		vvo.setUser_no(loginMember.getUser_no());
		
		replyService.bReplyInsert(vvo);
		
		return "client/reply";
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
	public String bReplyUpdateForm(@ModelAttribute("bReplyData") BreplyVO vvo, Model model) {
		log.info("BreplyUpdateForm 호출 성공");
		
		BreplyVO updateBreply = replyService.bReplyUpdateForm(vvo);
		model.addAttribute("bReplyUpdate", updateBreply);
		
		log.info("bUpdateReply : " + updateBreply);
		return "client/bReplyUpdateForm";
		
	}
	
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(@SessionAttribute("login") LoginVO loginMember, ReplyVO rvo, BreplyVO vvo, Model model, RedirectAttributes ras) throws Exception {
		log.info("replyUpdate 호출 성공");
		
		model.addAttribute(loginMember);
		
		rvo.setUser_no(loginMember.getUser_no());
		vvo.setUser_no(loginMember.getUser_no());
		
		replyService.replyUpdate(rvo);
		ras.addFlashAttribute("replyData", rvo);
		ras.addFlashAttribute("updateMsg", "리뷰를 수정하였습니다.");
		
		List<ReplyVO> replyList = replyService.replyList(rvo);
		List<BreplyVO> reserveList = replyService.reserveList(vvo);
		
		model.addAttribute("replyList", replyList);
		model.addAttribute("reserveList", reserveList);
		
		return "redirect:/reply/replyList";
	}
	
	@RequestMapping(value = "/bReplyUpdate", method = RequestMethod.POST)
	public String bReplyUpdate(@SessionAttribute("login") LoginVO loginMember, ReplyVO rvo, BreplyVO vvo, Model model, RedirectAttributes ras) throws Exception {
		log.info("bReplyUpdate 호출 성공");
		
		model.addAttribute(loginMember);
		
		rvo.setUser_no(loginMember.getUser_no());
		vvo.setUser_no(loginMember.getUser_no());
		
		replyService.bReplyUpdate(vvo);
		ras.addFlashAttribute("bReplyData", rvo);
		ras.addFlashAttribute("updateMsg", "리뷰를 수정하였습니다.");
		
		List<ReplyVO> replyList = replyService.replyList(rvo);
		List<BreplyVO> reserveList = replyService.reserveList(vvo);
		
		model.addAttribute("replyList", replyList);
		model.addAttribute("reserveList", reserveList);
		
		return "redirect:/reply/replyList";
	}

	@RequestMapping(value = "/replyDelete")
	public String replyDelete(@SessionAttribute("login") LoginVO loginMember, ReplyVO rvo, BreplyVO vvo, Model model, RedirectAttributes ras) throws Exception {
		log.info("replyDelete 호출 성공");
		
		model.addAttribute(loginMember);
		
		rvo.setUser_no(loginMember.getUser_no());
		vvo.setUser_no(loginMember.getUser_no());
		
		replyService.replyDelete(rvo);
		ras.addFlashAttribute("updateMsg", "상품 리뷰를 삭제하였습니다.");
		
		List<ReplyVO> replyList = replyService.replyList(rvo);
		List<BreplyVO> reserveList = replyService.reserveList(vvo);
		
		model.addAttribute("replyList", replyList);
		model.addAttribute("reserveList", reserveList);
		
		return "redirect:/reply/replyList";
	}
	
	@RequestMapping(value = "/bReplyDelete")
	public String bReplyDelete(@SessionAttribute("login") LoginVO loginMember, ReplyVO rvo, BreplyVO vvo, Model model, RedirectAttributes ras) throws Exception {
		log.info("bReplyDelete 호출 성공");
		
		model.addAttribute(loginMember);
		
		rvo.setUser_no(loginMember.getUser_no());
		vvo.setUser_no(loginMember.getUser_no());
		
		replyService.bReplyDelete(vvo);
		ras.addFlashAttribute("updateMsg", "양조장 체험 리뷰를 삭제하였습니다.");
		
		List<ReplyVO> replyList = replyService.replyList(rvo);
		List<BreplyVO> reserveList = replyService.reserveList(vvo);
		
		model.addAttribute("replyList", replyList);
		model.addAttribute("reserveList", reserveList);
		
		return "redirect:/reply/replyList";
	}
	
	
}
