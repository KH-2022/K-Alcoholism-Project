package com.kap.admin.reserve.service;

import java.util.List;

import com.kap.client.reserve.vo.ReserveVO;

public interface AdminReserveService {

	public List<ReserveVO> reserveList(ReserveVO rvo);

	public int reserveListCnt(ReserveVO rvo);

	public ReserveVO reserveDetail(ReserveVO rvo);

	public int reserveUpdate(ReserveVO rvo);
	
	public ReserveVO updateForm(ReserveVO rvo);

	public int reserveCancel(ReserveVO rvo);

}
