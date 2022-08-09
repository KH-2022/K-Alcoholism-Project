package com.kap.client.brewery.service;

import java.util.List;

import com.kap.client.brewery.vo.BreweryVO;

public interface BreweryService {

	public List<BreweryVO> breweryList(BreweryVO bvo);
	
	public int breweryListCnt(BreweryVO bvo);

	public BreweryVO breweryDetail(BreweryVO bvo);

	public BreweryVO reserveForm(BreweryVO bvo);
}
