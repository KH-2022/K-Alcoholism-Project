package com.kap.client.reserve.vo;

import com.kap.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ReserveVO extends CommonVO {
	private int rsv_no; //�����ȣ
	private String user_no; //ȸ����ȣ
	private String br_id; //������ID
	private String rsv_day; //���� ��¥
	private String rsv_time; //���� �ð�
	private int rsv_count; //���� �ο�
	private int rsv_price; //�� �ݾ�
	private String rsv_name; //������ �̸�
	private String rsv_tel; //������ ��ȭ��ȣ
	private String rsv_request; //���� ��û����
	private String rsv_state; //���� ����
	private String rsv_fin_date; //���� �Ϸ���
	
	private String user_id; //ȸ����ȣ�� �޾ƿ� ȸ�� ���̵�
	private String br_name; //������ID�� �޾ƿ� ������ �̸�
}