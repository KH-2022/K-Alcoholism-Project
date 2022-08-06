package com.kap.common.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CommonVO {
	/* ����¡ ó���� ����� �ʵ� */
	private int pageNum = 0; //������ ��ȣ
	private int amount = 0; //�������� ������ ������ ��
	
	/* ������ �̿��� �Խù� �˻� �� ����� �ʵ� */
	private String search = ""; //�˻����
	private String keyword = ""; //�˻��ܾ�
	
	public CommonVO() {
		this(1, 16);
	}

	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}