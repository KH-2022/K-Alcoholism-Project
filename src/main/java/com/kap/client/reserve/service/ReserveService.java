package com.kap.client.reserve.service;

import com.kap.client.reserve.vo.ReserveVO;

public interface ReserveService {

	public int breweryReserve(ReserveVO rvo);

	public ReserveVO reserveDetail(ReserveVO rvo);
	
}
