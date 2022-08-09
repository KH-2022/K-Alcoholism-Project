<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function() {
				/* 수정 버튼 클릭 시 */
				$("#reserveUpdateBtn").click(function() {
					if (!chkData("#rsv_day", "예약날짜를")) return;
					else if (!chkData("#rsv_time", "예약시간을")) return;
					else if ($("#rsv_count").val() === 0) {
						alert("예약인원을 입력해 주세요.");
						return;
					}
					else if (!chkData("#rsv_name", "예약자명을")) return;
					else if (!chkData("#rsv_tel", "예약자 전화번호를")) return;
					else {
						//예약날짜 정규표현식 검사
						var dayCheck = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
						if (!(dayCheck.test($("#rsv_day").val()))) {
							alert("예약날짜는 YYYY-MM-DD 형식에 맞게 입력해 주세요.");
							return;
						}
						
						//예약시간 정규표현식 검사
						var timeCheck = RegExp(/^([01][0-9]|2[0-3]):([0-5][0-9])$/);
						if (!(timeCheck.test($("#rsv_time").val()))) {
							alert("예약시간은 HH:MM 형식에 맞게 입력해 주세요.");
							return;
						}
						
						//예약자 연락처 정규표현식 검사
						var telCheck = RegExp(/^010\-([0-9]{4})\-[0-9]{4}$/);
						if (!(telCheck.test($("#rsv_tel").val()))) {
							alert("예약자 연락처는 010-####-#### 형식에 맞게 입력해 주세요.");
							return;
						}
						
						$("#updateForm").attr({
							"method" : "post",
							"action" : "/admin/reserve/reserveUpdate"
						});
						$("#updateForm").submit();
					}
				});
				
				/* 초기화 버튼 클릭 시 */
				$("#resetBtn").click(function() {
					$("#updateForm").each(function() {
						this.reset();
					});
				});
				
				/* 목록 버튼 클릭 시 */
				$("#reserveListBtn").click(function() {
					location.href = "/admin/reserve/reserveList";
				});
			});
		</script>
		<style type="text/css">
			textarea {resize: none;}
		</style>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header">
				<h3 class="text-center">예약정보 수정</h3>
				<h5 class="text-center">예약번호: ${updateData.rsv_no}</h5>
			</div>
			
			<%-- 수정 폼 --%>
			<div class="contentTB text-center">
				<form id="updateForm" name="updateForm" class="form-horizontal">
					<%-- 수정하기 위해 form 넘길 때 예약번호 필요 --%>
					<input type="hidden" id="rsv_no" name="rsv_no" value="${updateData.rsv_no}" />
					
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="col-md-1">예약확정일</td>
								<td class="col-md-2 text-left">${updateData.rsv_fin_date}</td>
								<td class="col-md-1">회원 ID</td>
								<td class="col-md-3 text-left">${updateData.user_id}</td>
								<td class="col-md-1">양조장명</td>
								<td class="col-md-4 text-left">${updateData.br_name}</td>
							</tr>
							<tr>
								<td class="col-md-1">예약시간</td>
								<td class="col-md-2 text-left">
									<input type="text" id="rsv_time" name="rsv_time" value="${updateData.rsv_time}" class="form-control" />
								</td>
								<td class="col-md-1">예약날짜</td>
								<td class="col-md-3 text-left">
									<input type="text" id="rsv_day" name="rsv_day" value="${updateData.rsv_day}" class="form-control" />
								</td>
								<td class="col-md-1">예약인원</td>
								<td class="col-md-4 text-left">
									<input type="number" id="rsv_count" name="rsv_count" value="${updateData.rsv_count}" class="form-control" />
								</td>
							</tr>
							<tr class="table-tr-height">
								<td class="col-md-1">예약자명</td>
								<td class="col-md-2 text-left">
									<input type="text" id="rsv_name" name="rsv_name" value="${updateData.rsv_name}" class="form-control" />
								</td>
								<td class="col-md-1">예약자 연락처</td>
								<td class="col-md-3 text-left">
									<input type="text" id="rsv_tel" name="rsv_tel" value="${updateData.rsv_tel}" class="form-control" />
								</td>
								<td class="col-md-1">요청사항</td>
								<td class="col-md-4 text-left">
									<textarea id="rsv_request" name="rsv_request" rows="4" class="form-control">${updateData.rsv_request}</textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			
			<%-- 버튼 모음 --%>
			<div class="text-right">
				<button type="button" id="reserveUpdateBtn" class="btn btn-success">수정</button>
				<button type="button" id="resetBtn" class="btn btn-success">초기화</button>
				<button type="button" id="reserveListBtn" class="btn btn-success">목록</button>
			</div>
		</div>
	</body>
</html>