<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function() {
				/* 검색 후 검색대상과 검색단어 초기화 방지 */
				let word = "<c:out value='${data.keyword}' />";
				let value = "";
				if (word != "") {
					$("#search").val("<c:out value='${data.search}' />");
					$("#keyword").val("<c:out value='${data.keyword}' />");
					
					console.log(search + ", " + keyword);
					
					/* 검색 결과에서 검색단어 글자색 변경 */
					if ($("#search").val() == "br_name") { //검색조건이 "양조장명"일 경우
						value = "#list tr td.br_name";
					} else if ($("#search").val() == "rsv_name") { //검색조건이 "예약자명"일 경우
						value = "#list tr td.rsv_name";
					}
					
					$(value + ":contains('" + word + "')").each(function() { // :contains() -> 특정 텍스트를 포함한 요소 반환
						let regex = new RegExp(word, 'gi'); //g: 전역(전체)에서 / i: 대소문자 관계 없이
						$(this).html($(this).html().replace(regex, "<span class='required'>" + word + "</span>"));
					});
				}
				
				/* 입력 양식 enter 제거 */
				$("#keyword").bind("keydown", function(event) {
					if (event.keyCode == 13) {
						event.preventDefault();
					}
				});
				
				/* 검색 조건 변경 시마다 처리할 이벤트 */
				$("#search").change(function() {
					$("#keyword").val("");
					$("#keyword").focus();
				});
				
				/* 검색 버튼 클릭 시 */
				$("#searchBtn").click(function() {
					if (!chkData("#keyword", "검색어를")) return;
					goPage();
				});
				
				/* 예약번호 클릭 시 상세 페이지 이동을 위한 처리 이벤트 */
				$(".goDetail").click(function() {
					let rsv_no = $(this).parents("tr").attr("data-num");
					$("#rsv_no").val(rsv_no);
					
					$("#detailForm").attr({
						"method" : "get",
						"action" : "/admin/reserve/reserveDetail"
					});
					$("#detailForm").submit();
				});
				
				/* 다음 페이지 클릭 시 */
				$(".paginate_button a").click(function(e) {
					e.preventDefault(); //원래 가진 이벤트 처리 배제
					$("#searchForm").find("input[name='pageNum']").val($(this).attr("href")); //클릭한 <a>의 href 속성값을 가져와 form의 pageNum 파라미터값을 갱신
					goPage();
				});
			}); //$함수 종료
			
			/* 예약정보 검색을 위한 함수 */
			function goPage() {
				$("#searchForm").attr({
					"method" : "get",
					"action" : "/admin/reserve/reserveList"
				});
				$("#searchForm").submit();
			}
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header"><h3 class="text-center">체험 예약 관리 목록</h3></div>
			
			<form id="detailForm">
				<input type="hidden" id="rsv_no" name="rsv_no"/>
			</form>
			
			<%-- ================= 검색기능 시작 ================= --%>
			<div id="reserveSearch" class="text-right">
				<form id="searchForm" name="searchForm" class="form-inline">
					<%-- 페이징 처리를 위한 파라미터 --%>
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<%-- 검색을 위한 파라미터 --%>
					<div class="form-group">
						<label>검색조건</label>
						<select id="search" name="search" class="form-control">
							<option value="br_name">양조장명</option>
							<option value="rsv_name">예약자명</option>
						</select>
						<input type="text" id="keyword" name="keyword" class="form-control" placeholder="검색어를 입력하세요" />
						<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
					</div>
				</form>
			</div>
			<%-- ================= 검색기능 종료 ================= --%>
		
			<%-- ================= 예약정보 리스트 ================= --%>
			<div id="reserveList" class="table-height">
				<table class="table table-striped">
					<thead>
						<tr>
							<th data-value="rsv_no" class="order text-center col-md-1">예약번호</th>
							<th class="text-center col-md-1">회원 ID</th>
							<th class="text-center col-md-1">양조장명</th>
							<th class="text-center col-md-1">예약날짜</th>
							<th class="text-center col-md-1">예약시간</th>
							<th class="text-center col-md-1">예약인원</th>
							<th class="text-center col-md-1">총 금액</th>
							<th class="text-center col-md-1">예약자명</th>
							<th class="text-center col-md-1">예약상태</th>
							<th data-value="rsv_fin_date" class="order text-center col-md-1">예약일</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty reserveList}">
								<c:forEach var="rsv" items="${reserveList}" varStatus="status">
									<tr class="text-center" data-num="${rsv.rsv_no}">
										<td class="goDetail"><a>${rsv.rsv_no}</a></td>
										<td>${rsv.user_id}</td>
										<td class="br_name">${rsv.br_name}</td>
										<td>${rsv.rsv_day}</td>
										<td>${rsv.rsv_time}</td>
										<td>${rsv.rsv_count}명</td>
										<td><fmt:formatNumber value="${rsv.rsv_price}" type="number" var="rsv_price" />${rsv_price}원</td>
										<td class="rsv_name">${rsv.rsv_name}</td>
										<td>${rsv.rsv_state}</td>
										<td >${rsv.rsv_fin_date}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="10" class="text-center">등록된 예약정보가 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<%-- 페이징 처리를 커스텀태그(pagination) 정의 --%>
			<tag:pagination pageNum="${pageMaker.cvo.pageNum}" amount="${pageMaker.cvo.amount}"
							startPage="${pageMaker.startPage}" endPage="${pageMaker.endPage}"
							prev="${pageMaker.prev}" next="${pageMaker.next}" />
		</div>
	</body>
</html>