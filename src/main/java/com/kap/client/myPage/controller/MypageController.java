package com.kap.client.myPage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.myPage.service.MypageService;
import com.kap.client.myPage.vo.MyPageOrderVO;
import com.kap.client.qna.vo.QnaVO;
import com.kap.client.reserve.vo.ReserveVO;
import com.kap.common.vo.PageDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
/* @SessionAttributes("login") */
@RequestMapping("/myPage/*")
@RequiredArgsConstructor
public class MypageController {
	private final MypageService mypageService;
	
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String mypageForm(@SessionAttribute("login") MemberVO loginMember, MyPageOrderVO ovo, Model model) {
		log.info("myPage order 호출 성공");
		
		model.addAttribute(loginMember);
		ovo.setUser_no(loginMember.getUser_no());
		
		List<Integer> getOrderNo = mypageService.getOrderNo(ovo);
		
		List<MyPageOrderVO> orderList = new ArrayList<MyPageOrderVO>();
		
		List<MyPageOrderVO> orderCount = new ArrayList<MyPageOrderVO>();
		
		for(int i=0; i<getOrderNo.size(); i++) {
			ovo.setOrder_no(getOrderNo.get(i));
			orderList.addAll(mypageService.orderList(ovo));
			orderCount.addAll(mypageService.orderCount(ovo));
		}
		model.addAttribute("orderList",orderList);
		log.info("orderList = "+orderList);
		model.addAttribute("orderCount",orderCount);
		
		int total = mypageService.orderListCnt(ovo);
		model.addAttribute("pageMaker", new PageDTO(total, ovo));
		
		int count = total - (ovo.getPageNum()-1) * ovo.getAmount();
		model.addAttribute("count",count);
		
		return "client/myPage";
	}
	
	@RequestMapping(value="/orderDetail", method = RequestMethod.GET)
	public String orderDetailForm(@SessionAttribute("login") MemberVO loginMember, MyPageOrderVO ovo, Model model) {
		log.info("orderDetail 호출 성공");
		
		model.addAttribute(loginMember);
		ovo.setUser_no(loginMember.getUser_no());
		
		List<MyPageOrderVO> orderDetail = mypageService.orderDetail(ovo);
		model.addAttribute("orderDetail",orderDetail);
		
		return "client/orderDetail";
	}
	
	@RequestMapping(value="/reserve", method = RequestMethod.GET)
	public String rezForm(@SessionAttribute("login") MemberVO loginMember, ReserveVO rvo, Model model ) {
		log.info("myPage reserve 호출 성공");
		
		model.addAttribute(loginMember);
		rvo.setUser_no(loginMember.getUser_no());
		
		List<ReserveVO> reserveList = mypageService.reserveList(rvo);
		model.addAttribute("reserveList",reserveList);
		
		int total = mypageService.reserveListCnt(rvo);
		model.addAttribute("pageMaker", new PageDTO(total, rvo));
		
		int count = total - (rvo.getPageNum()-1) * rvo.getAmount();
		model.addAttribute("count",count);
		
		return "client/reserve";
	}
	
	@RequestMapping(value="/qna", method = RequestMethod.GET)
	public String qnaForm(@SessionAttribute("login") MemberVO loginMember, QnaVO qvo, Model model) {
		model.addAttribute(loginMember);
		qvo.setUser_no(loginMember.getUser_no());
		
		List<QnaVO> qnaList = mypageService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		
		return "client/qna";
	}
	
	@RequestMapping(value="/withdrawal", method = RequestMethod.GET)
	public String withdrawalForm(MemberVO mvo) {
		return "client/withdrawal";
	}
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String addForm(MemberVO mvo) {
		return "client/add";
	}
	
	@RequestMapping(value="/accountCheck", method = RequestMethod.GET)
	public String accountCheckForm(@ModelAttribute MemberVO mvo, Model model) {
		return "client/accountCheck";
	}
	
	@RequestMapping(value="/account", method = RequestMethod.POST)
	public String accountForm(@ModelAttribute MemberVO mvo, Model model) {
		return "client/account";
	}
	
	@RequestMapping(value="/userUpdate", method = RequestMethod.POST)
	public String userUpdate(HttpServletRequest request, @ModelAttribute MemberVO mvo, Model model, RedirectAttributes ras ) throws Exception{
		HttpSession session = request.getSession();
		
		log.info("userUpdate 호출 성공");
		String url = "";
		int result = mypageService.userUpdate(mvo);
		
		if(result == 1) {
			ras.addFlashAttribute("updateMsg", "회원정보 수정이 완료되었습니다.");
			url = "/myPage/accountCheck";
		} else {
			ras.addFlashAttribute("errorMsg", "회원정보 수정에 실패하였습니다. 관리자에게 문의하세요.");
			url = "/";
		}
		
		MemberVO updateSession = mypageService.getUser(mvo);
	      if(updateSession != null) 
		session.setAttribute("login", updateSession);
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/editAdd", method = RequestMethod.POST)
	public String editAdd(HttpServletRequest request, @ModelAttribute MemberVO mvo, RedirectAttributes ras, Model model) throws Exception{
		HttpSession session = request.getSession();
		
		log.info("editAdd 호출 성공");
		String url = "";
		int result = mypageService.editAdd(mvo);
		if(result == 1) {
			ras.addFlashAttribute("updateMsg", "기본 배송지가 수정 되었습니다.");
			url = "/myPage/add";
		} else {
			ras.addFlashAttribute("errorMsg", "회원정보 수정에 실패하였습니다. 관리자에게 문의하세요.");
			url = "/";
		}
		MemberVO updateSession = mypageService.getUser(mvo);
	      if(updateSession != null) 
		session.setAttribute("login", updateSession);
	      
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/userWithdrawal", method=RequestMethod.POST)
	public String userWithdrawal(MemberVO mvo, RedirectAttributes ras, SessionStatus sessionStatus) throws Exception{
		log.info("userWithdrawal 호출 성공");
		String url = "";
		
		int result = mypageService.userWithdrawal(mvo);
		if(result == 1) {
			ras.addFlashAttribute("WithdrawalMsg", "회원탈퇴가 완료되었습니다. 감사합니다.");
			sessionStatus.setComplete();
			url = "/";
		} else {
			ras.addFlashAttribute("errorMsg", "회원탈퇴에 실패하였습니다. 관리자에게 문의하세요.");
			url = "/";
		}

		return "redirect:"+url;
	}
}