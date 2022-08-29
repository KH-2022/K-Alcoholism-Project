package com.kap.admin.reserve.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.reserve.service.AdminReserveService;
import com.kap.client.reserve.vo.ReserveVO;
import com.kap.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
@AllArgsConstructor
public class AdminReserveController {
	
	private AdminReserveService adminReserveService;
	
	/* ������ ��ȸ ���� */
	@RequestMapping(value = "/reserve/reserveList", method = RequestMethod.GET)
	public String reserveList(@ModelAttribute("data") ReserveVO rvo, Model model) {
		log.info("admin reserveList ȣ�� ����");
		List<ReserveVO> reserveList = adminReserveService.reserveList(rvo);
		model.addAttribute("reserveList", reserveList);
		
		// ��ü ���ڵ� �� ���ϱ�
		int total = adminReserveService.reserveListCnt(rvo);
		model.addAttribute("pageMaker", new PageDTO(total, rvo));
		
		return "admin/reserve/reserveList";
	}
	
	/* �������� �� ��ȸ */
	@RequestMapping(value = "/reserve/reserveDetail", method = RequestMethod.GET)
	public String reserveDetail(@ModelAttribute("data") ReserveVO rvo, Model model) {
		log.info("admin reserveDetail ȣ�� ����");
		ReserveVO detail = adminReserveService.reserveDetail(rvo);
		model.addAttribute("detail", detail);
		
		return "admin/reserve/reserveDetail";
	}
	
	/* �������� ���� �� ��� */
	@RequestMapping(value = "/reserve/updateForm")
	public String updateForm(@ModelAttribute ReserveVO rvo, Model model) {
		log.info("admin updateForm ȣ�� ����");
		ReserveVO updateData = adminReserveService.updateForm(rvo);
		model.addAttribute("updateData", updateData);
		
		return "admin/reserve/updateForm";
	}
	
	/* �������� ���� ���� */
	@RequestMapping(value = "/reserve/reserveUpdate", method = RequestMethod.POST)
	public String reserveUpdate(@ModelAttribute ReserveVO rvo, RedirectAttributes reAttr) throws Exception {
		log.info("admin reserveUpdate ȣ�� ����");
		
		int result = 0;
		String url = "";
		result = adminReserveService.reserveUpdate(rvo);
		reAttr.addFlashAttribute("data", rvo);
		
		if (result == 1) {
			url = "/admin/reserve/reserveDetail";
		} else {
			url = "/admin/reserve/updateForm";
		}
		
		return "redirect:" + url;
	}
	
	/* ���� ��� ���� */
	@RequestMapping(value = "/reserve/reserveCancel")
	public String reserveCancel(@ModelAttribute ReserveVO rvo, RedirectAttributes reAttr) throws Exception {
		log.info("admin reserveCancel ȣ�� ����");
		
		int result = 0;
		String url = "";
		result = adminReserveService.reserveCancel(rvo);
		reAttr.addFlashAttribute("data", rvo);
		
		if (result == 1) {
			url = "/admin/reserve/reserveList";
		} else {
			url = "/admin/reserve/reserveDetail";
		}
		
		return "redirect:" + url;
	}
}