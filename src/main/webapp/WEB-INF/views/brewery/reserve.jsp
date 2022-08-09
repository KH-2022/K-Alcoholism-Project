<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function() {
				/* 예약목록 확인 버튼 클릭 시 처리 이벤트 */
				$("#reserveListBtn").click(function() {
					//마이페이지의 예약목록으로 이동
				});
				
				/* 양조장 목록 버튼 클릭 시 처리 이벤트 */
				$("#breweryListBtn").click(function() {
					location.href = "/brewery/breweryList";
				});
				
				/* 홈 버튼 클릭 시 처리 이벤트 */
				$("#homeBtn").click(function() {
					location.href = "/";
				});
			});
		</script>
		<style>
			.no-rsvReq {
				font-size: 0.8em;
				color: gray;
			}
		</style>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">양조장 체험 예약</h1>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 예약정보 확인 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-lg-6 text-center mx-auto">
						<h2 class="font-weight-bold text-primary heading">양조장 체험 예약 내역</h2>
					</div>
				</div>
				<div class="row contentTB text-center">
					<table class="table table-bordered">
						<tr>
							<td class="col-md-1">예약번호</td>
							<td class="col-md-1 text-left">${detail.rsv_no}</td>
							<td class="col-md-1">예약확정일</td>
							<td class="col-md-2 text-left">${detail.rsv_fin_date}</td>
							<td class="col-md-1">회원 ID</td>
							<td class="col-md-2 text-left">${detail.user_id}</td>
							<td class="col-md-1">양조장명</td>
							<td class="col-md-1 text-left">${detail.br_name}</td>
						</tr>
						<tr>
							<td class="col-md-1">예약시간</td>
							<td class="col-md-1 text-left">${detail.rsv_time}</td>
							<td class="col-md-1">예약날짜</td>
							<td class="col-md-2 text-left">${detail.rsv_day}</td>
							<td class="col-md-1">예약인원</td>
							<td class="col-md-2 text-left">${detail.rsv_count}명</td>
							<td class="col-md-1">총 금액</td>
							<td class="col-md-1 text-left">${detail.rsv_price}원</td>
						</tr>
						<tr>
							<td class="col-md-1">예약자명</td>
							<td class="col-md-1 text-left">${detail.rsv_name}</td>
							<td class="col-md-1">예약자 연락처</td>
							<td class="col-md-2 text-left">${detail.rsv_tel}</td>
							<td class="col-md-1">요청사항</td>
							<td class="col-md-2 text-left">
								<c:choose>
									<c:when test="${not empty detail.rsv_request}">
										${detail.rsv_request}
									</c:when>
									<c:otherwise>
										<span class="no-rsvReq">요청사항 없음</span>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="col-md-1">예약상태</td>
							<td class="col-md-1 text-left">${detail.rsv_state}</td>
						</tr>
					</table>
				</div>
		
				<%-- 페이지 이동을 위한 버튼 --%>
				<div class="section">
					<div class="container">
						<div class="row mb-5 align-items-center">
							<div class="col-md-6">
								<button type="button" id="reserveListBtn" class="btn btn-primary">예약목록 확인</button>
								<button type="button" id="breweryListBtn" class="btn btn-primary">양조장 목록으로</button>
								<button type="button" id="homeBtn" class="btn btn-primary">홈으로</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>