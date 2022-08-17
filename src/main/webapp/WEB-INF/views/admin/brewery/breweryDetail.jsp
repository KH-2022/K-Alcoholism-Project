<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function(){
				/* 수정 버튼 클릭시 처리이벤트 */
				$("#updateFormBtn").click(function() {
					$("#f_data").attr("action","/admin/brewery/updateForm")
					$("#f_data").submit();
				});
				
				/* 삭제 버튼 클릭시 처리이벤트 */
				$("#breweryDeleteBtn").click(function() {
					if (confirm("정말 삭제하시겠습니까?")) {
						$("#f_data").attr("action","/admin/brewery/breweryDelete")
						$("#f_data").submit();
					}
				});
				
				/* 등록 버튼 클릭 시 처리 이벤트 */
				$("#insertFormBtn").click(function() {
					location.href = "/admin/brewery/writeForm";
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#breweryListBtn").click(function() {
					location.href = "/admin/brewery/breweryList";
				});		
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header text-center">
				<h2>양조장 상세 정보</h2>
			</div>
			
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="br_id" value="${detail.br_id}">
				<input type="hidden" name="br_image" value="${detail.br_image}" />
				<input type="hidden" name="br_thumb" value="${detail.br_thumb}" />
			</form>

			<%-- 버튼 --%>
			<div class="btnGroup text-right">
				<input type="button" value="양조장 수정" id="updateFormBtn" class="btn btn-primary" />
				<input type="button" value="양조장 삭제" id="breweryDeleteBtn" class="btn btn-primary" />
				<input type="button" value="양조장 등록" id="insertFormBtn" class="btn btn-primary" />
				<input type="button" value="양조장 목록" id="breweryListBtn" class="btn btn-primary" />
			</div>
			
			<%-- 양조장 상세 --%>
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<tr>
						<td class="col-md-2">양조장ID</td>
						<td class="col-md-2 text-left">${detail.br_id}</td>
						<td class="col-md-2">양조장명</td>
						<td class="col-md-2 text-left">${detail.br_name}</td>
						<td class="col-md-2">양조장 등록일</td>
						<td class="col-md-2 text-left">${detail.br_date}</td>
					</tr>
					<tr>
						<td class="col-md-2">취급주종</td>
						<td class="col-md-2 text-left">${detail.br_type}</td>
						<td class="col-md-2">양조장 전화번호</td>
						<td class="col-md-2 text-left">${detail.br_tel}</td>
						<td class="col-md-2">양조장 홈페이지</td>
						<td class="col-md-2 text-left">
							<c:if test="${not empty detail.br_site}">
								<a href="${detail.br_site}">${detail.br_site}</a>
							</c:if>
							<c:if test="${empty detail.br_site}">
								<span class="no-detail">홈페이지 없음</span>
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="col-md-2">체험 프로그램</td>
						<td class="col-md-2 text-left">${detail.br_program}</td>
						<td class="col-md-2">소요시간</td>
						<td class="col-md-2 text-left">${detail.br_time}분</td>
						<td class="col-md-2">인당 체험비용</td>
						<td class="col-md-2 text-left">
							<fmt:formatNumber value="${detail.br_price}" type="number" var="br_price" />${br_price}원
						</td>
					</tr>
					<tr>
						<td class="col-md-2">양조장 주소</td>
						<td colspan="5" class="col-md-2 text-left">${detail.br_addr} (${detail.br_region})</td>
					</tr>
					<tr>
						<td class="col-md-2">이미지</td>
						<td colspan="5" class="col-md-10 text-left">
							<c:if test="${not empty detail.br_image}">
								<img class="detail-img" src="/uploadStorage/brewery/${detail.br_image}" />
							</c:if>
							<c:if test="${empty detail.br_image}">
								<img src="/resources/images/common/noImage.jpg" />
							</c:if>
						</td>
					</tr>
					<tr class="table-tr-height">
						<td class="col-md-2">양조장 소개</td>
						<td colspan="5" class="col-md-10 text-left">${detail.br_info}</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>