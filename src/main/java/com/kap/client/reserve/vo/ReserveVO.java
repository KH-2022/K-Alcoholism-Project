package com.kap.client.reserve.vo;

import com.kap.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ReserveVO extends CommonVO {
	private int rsv_no; //예약번호
	private String user_no; //회원번호
	private String br_id; //양조장ID
	private String rsv_day; //예약 날짜
	private String rsv_time; //예약 시간
	private int rsv_count; //예약 인원
	private int rsv_price; //총 금액
	private String rsv_name; //예약자 이름
	private String rsv_tel; //예약자 전화번호
	private String rsv_request; //예약 요청사항
	private String rsv_state; //예약 상태
	private String rsv_fin_date; //예약 완료일
	
	private String user_id; //회원번호로 받아온 회원 아이디
	private String br_name; //양조장ID로 받아온 양조장 이름
}