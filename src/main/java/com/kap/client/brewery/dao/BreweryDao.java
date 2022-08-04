package com.kap.client.brewery.dao;

import java.util.List;

import com.kap.client.brewery.vo.BreweryVO;

public interface BreweryDao {
	public List<BreweryVO> breweryList(BreweryVO bvo);

	public BreweryVO breweryDetail(BreweryVO bvo);

	public int breweryInsert(BreweryVO bvo);

	public int breweryUpdate(BreweryVO bvo);

	public int breweryDelete(int br_id);
}
