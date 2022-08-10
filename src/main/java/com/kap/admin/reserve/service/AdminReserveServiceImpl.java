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

	/* ������ ��ȸ ���� */
	@Override
	public List<ReserveVO> reserveList(ReserveVO rvo) {
		List<ReserveVO> reserveList = null;
		reserveDao.stateUpdate(rvo); //��� ��ȸ �� rsv_day�� ���� �����̸� ������� ����
		reserveList = reserveDao.reserveList(rvo);
		return reserveList;
	}

	/* �������� ���ڵ�� ��ȸ */
	@Override
	public int reserveListCnt(ReserveVO rvo) {
		int count = 0;
		count = reserveDao.reserveListCnt(rvo);
		return count;
	}

	/* �������� �� ��ȸ ���� */
	@Override
	public ReserveVO reserveDetail(ReserveVO rvo) {
		ReserveVO detail = null;
		detail = reserveDao.reserveDetail(rvo);
		if (detail != null) {
			detail.setRsv_request(detail.getRsv_request().toString().replaceAll("\n", "<br/>"));
		}
		return detail;
	}
	
	/* �������� ���� �� ��� */
	@Override
	public ReserveVO updateForm(ReserveVO rvo) {
		ReserveVO updateData = null;
		updateData = reserveDao.reserveDetail(rvo);
		return updateData;
	}

	/* �������� ���� ���� */
	@Override
	public int reserveUpdate(ReserveVO rvo) {
		int result = 0;
		result = reserveDao.reserveUpdate(rvo);
		return result;
	}

	/* ���� ��� ���� */
	@Override
	public int reserveCancel(ReserveVO rvo) {
		int result = 0;
		result = reserveDao.reserveCancel(rvo);
		return result;
	}
	
	
}