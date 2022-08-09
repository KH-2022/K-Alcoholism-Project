package com.kap.client.brewery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.brewery.dao.BreweryDao;
import com.kap.client.brewery.vo.BreweryVO;

import lombok.Setter;

@Service
public class BreweryServiceImpl implements BreweryService {
	
	@Setter(onMethod_ = @Autowired)
	private BreweryDao breweryDao;

	/* 양조장 리스트 구현 */
	@Override
	public List<BreweryVO> breweryList(BreweryVO bvo) {
		List<BreweryVO> list = null;
		list = breweryDao.breweryList(bvo);
		return list;
	}
	
	/* 전체 레코드 수 조회 */
	@Override
	public int breweryListCnt(BreweryVO bvo) {
		int count = 0;
		count = breweryDao.breweryListCnt(bvo);
		return count;
	}

	/* 양조장 상세 구현 */
	@Override
	public BreweryVO breweryDetail(BreweryVO bvo) {
		BreweryVO detail = null;
		detail = breweryDao.breweryDetail(bvo);
		return detail;
	}

	/* 체험 예약 폼 호출 */
	@Override
	public BreweryVO reserveForm(BreweryVO bvo) {
		BreweryVO data = null;
		data = breweryDao.breweryDetail(bvo);
		return data;
	}
}
