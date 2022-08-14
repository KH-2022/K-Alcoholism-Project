package com.kap.admin.brewery.service;

import java.util.List;

import com.kap.client.brewery.vo.BreweryVO;

public interface AdminBreweryService {
	public List<BreweryVO> breweryList(BreweryVO bvo);
	
	public int breweryListCnt(BreweryVO bvo);

	public BreweryVO breweryDetail(BreweryVO bvo);

	public int breweryInsert(BreweryVO bvo) throws Exception;

	public BreweryVO updateForm(BreweryVO bvo);

	public int breweryUpdate(BreweryVO bvo) throws Exception;

	public int breweryDelete(BreweryVO bvo) throws Exception;

	
}
