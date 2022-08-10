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

	/* ������ ����Ʈ ���� */
	@Override
	public List<BreweryVO> breweryList(BreweryVO bvo) {
		List<BreweryVO> list = null;
		list = breweryDao.breweryList(bvo);
		return list;
	}
	
	/* ��ü ���ڵ� �� ��ȸ */
	@Override
	public int breweryListCnt(BreweryVO bvo) {
		int count = 0;
		count = breweryDao.breweryListCnt(bvo);
		return count;
	}

	/* ������ �� ���� */
	@Override
	public BreweryVO breweryDetail(BreweryVO bvo) {
		BreweryVO detail = null;
		detail = breweryDao.breweryDetail(bvo);
		if (detail != null) {
			detail.setBr_info(detail.getBr_info().toString().replaceAll("\n", "<br/>"));
		}
		return detail;
	}

	/* ü�� ���� �� ȣ�� */
	@Override
	public BreweryVO reserveForm(BreweryVO bvo) {
		BreweryVO data = null;
		data = breweryDao.breweryDetail(bvo);
		return data;
	}
}