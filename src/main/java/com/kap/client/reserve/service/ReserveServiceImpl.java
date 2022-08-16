package com.kap.client.reserve.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.reserve.dao.ReserveDao;
import com.kap.client.reserve.vo.ReserveVO;

import lombok.Setter;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Setter(onMethod_ = @Autowired)
	private ReserveDao reserveDao;

	/* ���� ó�� ���� */
	@Override
	public int breweryReserve(ReserveVO rvo) {
		int result = 0;
		result = reserveDao.breweryReserve(rvo);
		return result;
	}

	/* �������� �� ��ȸ */
	@Override
	public ReserveVO reserveDetail(ReserveVO rvo) {
		ReserveVO detail = null;
		detail = reserveDao.reserveDetail(rvo);
		if (detail != null) {
			detail.setRsv_request(detail.getRsv_request().toString().replaceAll("\n", "<br/>"));
		}
		return detail;
	}
	
}
