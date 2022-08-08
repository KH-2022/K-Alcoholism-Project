package com.kap.common.vo;

import lombok.Getter;

@Getter
public class PageDTO {
	private int startPage; //화면에서 보여지는 페이지의 시작번호
	private int endPage; //화면에서 보여지는 페이지의 끝번호
	private boolean prev, next; //이전이나 다음으로 이동할 링크 표시 여부
	
	private int total; //
	private CommonVO cvo;
	
	public PageDTO(int total, CommonVO cvo) {
		this.total = total;
		this.cvo = cvo;
		
		/* 각 페이지의 끝번호(endPage) 구하기 */
		this.endPage = (int) (Math.ceil(cvo.getPageNum() / 10.0)) * 10; //Math.ceil(): 실수를 올림 처리하는 메서드
		/* 1페이지의 경우:  Math.ceil(0.1) * 10 = 10
		 * 2페이지의 경우:  Math.ceil(0.2) * 10 = 10
		 * 10페이지의 경우: Math.ceil(1.0) * 10 = 10
		 * 11페이지의 경우: Math.ceil(1.1) * 10 = 20
		 * */
		
		/* 각 페이지의 시작번호(startPage) 구하기 */
		this.startPage = this.endPage - 9;
		
		/* 끝페이지 구하기 */
		int realEnd = (int) (Math.ceil((total * 1.0) / cvo.getAmount()));
		/* total이 10일 경우:  Math.ceil(10.0 / 16) = 1
		 * total이 30일 경우:  Math.ceil(30.0 / 16) = 2
		 * total이 126일 경우: Math.ceil(126.0 / 16) = 8
		 * total이 473일 경우: Math.ceil(473.0 / 16) = 30
		 * */
		
		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		/* prev(이전 10개) 존재 여부 구하기 */
		this.prev = this.startPage > 1;
		
		/* next(다음 10개) 존재 여부 구하기 */
		this.next = this.endPage < realEnd;
	}
}