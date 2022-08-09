package com.kap.admin.reserve.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.reserve.dao.ReserveDao;
import com.kap.client.reserve.vo.ReserveVO;

import lombok.Setter;

@Service
public class AdminReserveServiceImpl implements AdminReserveService {

	@Setter(onMethod_ = @Autowired)
	private ReserveDao reserveDao;

	/* 예약목록 조회 구현 */
	@Override
	public List<ReserveVO> reserveList(ReserveVO rvo) {
		List<ReserveVO> reserveList = null;
		reserveDao.stateUpdate(rvo); //목록 조회 시 rsv_day가 오늘 이전이면 예약상태 변경
		reserveList = reserveDao.reserveList(rvo);
		return reserveList;
	}

	/* 예약정보 레코드수 조회 */
	@Override
	public int reserveListCnt(ReserveVO rvo) {
		int count = 0;
		count = reserveDao.reserveListCnt(rvo);
		return count;
	}

	/* 예약정보 상세 조회 구현 */
	@Override
	public ReserveVO reserveDetail(ReserveVO rvo) {
		ReserveVO detail = null;
		detail = reserveDao.reserveDetail(rvo);
		if (detail != null) {
			detail.setRsv_request(detail.getRsv_request().toString().replaceAll("\n", "<br/>"));
		}
		return detail;
	}
	
	/* 예약정보 수정 폼 출력 */
	@Override
	public ReserveVO updateForm(ReserveVO rvo) {
		ReserveVO updateData = null;
		updateData = reserveDao.reserveDetail(rvo);
		return updateData;
	}

	/* 예약정보 수정 구현 */
	@Override
	public int reserveUpdate(ReserveVO rvo) {
		int result = 0;
		result = reserveDao.reserveUpdate(rvo);
		return result;
	}

	/* 예약 취소 구현 */
	@Override
	public int reserveCancel(ReserveVO rvo) {
		int result = 0;
		result = reserveDao.reserveCancel(rvo);
		return result;
	}
	
	
}
