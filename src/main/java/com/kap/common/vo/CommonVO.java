package com.kap.common.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CommonVO {
	/* 페이징 처리에 사용할 필드 */
	private int pageNum = 0; //페이지 번호
	private int amount = 0; //페이지에 보여줄 데이터 수
	
	/* 조건을 이용한 게시물 검색 시 사용할 필드 */
	private String search = ""; //검색대상
	private String keyword = ""; //검색단어
	
	public CommonVO() {
		this(1, 16);
	}

	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}