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

	/* ¿¹¾à Ã³¸® ±¸Çö */
	@Override
	public int reserveInsert(ReserveVO rvo) {
		int result = 0;
		result = reserveDao.reserveInsert(rvo);
		return result;
	}

	/* ¿¹¾àÁ¤º¸ »ó¼¼ Á¶È¸ */
	@Override
	public ReserveVO reserveDetail(ReserveVO rvo) {
		ReserveVO detail = null;
		detail = reserveDao.reserveDetail(rvo);
		if (detail != null && detail.getRsv_request() != null) {
			detail.setRsv_request(detail.getRsv_request().toString().replaceAll("\n", "<br/>"));
		}
		return detail;
	}

	/* ì˜ˆì•½ ì·¨ì†Œ êµ¬í˜„ */
	@Override
	public int reserveCancel(ReserveVO rvo) {
		int result = 0;
		result = reserveDao.reserveCancel(rvo);
		return result;
	}

}
