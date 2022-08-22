<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function() {
				/* 예약수정 버튼 클릭 시 */
				$("#updateFormBtn").click(function() {
					$("#formData").attr("action", "/admin/reserve/updateForm");
					$("#formData").submit();
				});
				
				/* 예약취소 버튼 클릭 시 */
				$("#reserveCancelBtn").click(function() {
					if (confirm("정말 예약을 취소하시겠습니까?")) {
						$("#formData").attr("action", "/admin/reserve/reserveCancel");
						$("#formData").submit();
					}
				});
				
				/* 목록 버튼 클릭 시 */
				$("#reserveListBtn").click(function() {
					location.href = "/admin/reserve/reserveList";
				});
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header text-center">
				<h2>체험 예약 상세 정보</h2>
			</div>
		
			<%-- 예약 수정/취소 시 예약번호를 넘겨주기 위한 form --%>
			<form id="formData" name="formData" method="post">
				<input type="hidden" name="rsv_no" value="${detail.rsv_no}" />
			</form>
			
			<%-- 버튼 --%>
			<div class="btnGroup contentBtn text-right">
				<button type="button" id="updateFormBtn" class="btn btn-primary">예약 수정</button>
				<button type="button" id="reserveCancelBtn" class="btn btn-primary">예약 취소</button>
				<button type="button" id="reserveListBtn" class="btn btn-primary">예약정보 목록</button>
			</div>
			
			<%-- 예약정보 상세 --%>
			<div class="contentTB text-center">
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
						<td class="col-md-1 text-left"><fmt:formatNumber value="${detail.rsv_price}" type="number" var="rsv_price" />${rsv_price}원</td>
					</tr>
					<tr>
						<td class="col-md-1">예약자명</td>
						<td class="col-md-1 text-left">${detail.rsv_name}</td>
						<td class="col-md-1">예약자 연락처</td>
						<td class="col-md-2 text-left">${detail.rsv_tel}</td>
						<td class="col-md-1">요청사항</td>
						<td class="col-md-2 text-left">
							<c:if test="${not empty detail.rsv_request}">
								${detail.rsv_request}
							</c:if>
							<c:if test="${empty detail.rsv_request}">
								<span class="no-detail">요청사항 없음</span>
							</c:if>
						</td>
						<td class="col-md-1">예약상태</td>
						<td class="col-md-1 text-left">${detail.rsv_state}</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>