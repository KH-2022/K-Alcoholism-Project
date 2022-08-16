package com.kap.client.reserve.dao;

import java.util.List;

import com.kap.client.reserve.vo.ReserveVO;

public interface ReserveDao {

	public List<ReserveVO> reserveList(ReserveVO rvo);
	
	public int reserveListCnt(ReserveVO rvo);
	
	public void stateUpdate(ReserveVO rvo);

	public ReserveVO reserveDetail(ReserveVO rvo);

	public int reserveUpdate(ReserveVO rvo);

	public int reserveCancel(ReserveVO rvo);

	public int reserveInsert(ReserveVO rvo);
}
