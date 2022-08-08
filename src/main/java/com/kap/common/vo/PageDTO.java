package com.kap.common.vo;

import lombok.Getter;

@Getter
public class PageDTO {
	private int startPage; //ȭ�鿡�� �������� �������� ���۹�ȣ
	private int endPage; //ȭ�鿡�� �������� �������� ����ȣ
	private boolean prev, next; //�����̳� �������� �̵��� ��ũ ǥ�� ����
	
	private int total; //
	private CommonVO cvo;
	
	public PageDTO(int total, CommonVO cvo) {
		this.total = total;
		this.cvo = cvo;
		
		/* �� �������� ����ȣ(endPage) ���ϱ� */
		this.endPage = (int) (Math.ceil(cvo.getPageNum() / 10.0)) * 10; //Math.ceil(): �Ǽ��� �ø� ó���ϴ� �޼���
		/* 1�������� ���:  Math.ceil(0.1) * 10 = 10
		 * 2�������� ���:  Math.ceil(0.2) * 10 = 10
		 * 10�������� ���: Math.ceil(1.0) * 10 = 10
		 * 11�������� ���: Math.ceil(1.1) * 10 = 20
		 * */
		
		/* �� �������� ���۹�ȣ(startPage) ���ϱ� */
		this.startPage = this.endPage - 9;
		
		/* �������� ���ϱ� */
		int realEnd = (int) (Math.ceil((total * 1.0) / cvo.getAmount()));
		/* total�� 10�� ���:  Math.ceil(10.0 / 16) = 1
		 * total�� 30�� ���:  Math.ceil(30.0 / 16) = 2
		 * total�� 126�� ���: Math.ceil(126.0 / 16) = 8
		 * total�� 473�� ���: Math.ceil(473.0 / 16) = 30
		 * */
		
		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		/* prev(���� 10��) ���� ���� ���ϱ� */
		this.prev = this.startPage > 1;
		
		/* next(���� 10��) ���� ���� ���ϱ� */
		this.next = this.endPage < realEnd;
	}
}