package com.kap.admin.member.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.member.service.AdminMemberService;
import com.kap.admin.member.vo.MemberVO;
import com.kap.common.vo.PageDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value="/admin/*")
@RequiredArgsConstructor
public class AdminMemberController {
	
	private final AdminMemberService adminMemberService;
	
	@RequestMapping(value="/member/memberList", method = RequestMethod.GET)
	public String memberList(MemberVO mvo, Model model) {
		log.info("AdminMemeberList 호출 성공");
		
		List<MemberVO> memberList = adminMemberService.memberList(mvo);
		model.addAttribute("memberList",memberList);
		
		int total = adminMemberService.memberListCnt(mvo);
		model.addAttribute("pageMaker", new PageDTO(total, mvo));
		
		int count = total - (mvo.getPageNum()-1) * mvo.getAmount();
		model.addAttribute("count",count);
		
		return "admin/member/memberList";
	}
	
	@RequestMapping(value="/member/memberDelete", method = RequestMethod.POST)
	public String memberDelete(@RequestParam(required=false, value="user_no")Integer user_no, MemberVO mvo, RedirectAttributes ras, Model model) {
		log.info("memberDelete 호출 성공");
		
		adminMemberService.memberDelete(mvo);
		ras.addFlashAttribute("deleteMsg","회원탈퇴가 완료되었습니다.");
		
		return "redirect:/admin/member/memberList";
	}
	
}
