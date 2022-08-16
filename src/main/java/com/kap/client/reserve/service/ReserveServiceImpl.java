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

	/* 예약 처리 구현 */
	@Override
	public int reserveInsert(ReserveVO rvo) {
		int result = 0;
		result = reserveDao.reserveInsert(rvo);
		return result;
	}

	/* 예약정보 상세 조회 */
	@Override
	public ReserveVO reserveDetail(ReserveVO rvo) {
		ReserveVO detail = null;
		detail = reserveDao.reserveDetail(rvo);
		if (detail != null && detail.getRsv_request() != null) {
			detail.setRsv_request(detail.getRsv_request().toString().replaceAll("\n", "<br/>"));
		}
		return detail;
	}

	/* 예약 취소 구현 */
	@Override
	public int reserveCancel(ReserveVO rvo) {
		int result = 0;
		result = reserveDao.reserveCancel(rvo);
		return result;
	}

}
