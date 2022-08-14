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
					
					/* 검색 결과에서 검색단어 글자색 변경 */
					if ($("#search").val() == "br_name") { //검색조건이 "양조장명"일 경우
						value = "#list tr td.goDetail";
					} else if ($("#search").val() == "br_region") { //검색조건이 "지역명"일 경우
						value = "#list tr td.region";
					} else if ($("#search").val() == "br_program") { //검색조건이 "프로그램명"일 경우
						value = "#list tr td.program";
					}
					
					$(value + ":contains('" + word + "')").each(function() {
						let regex = new RegExp(word, 'gi');
						$(this).html($(this).html().replace(regex, "<span class='required'>" + word + "</span>"));
					});
				}
				
				/* 검색 입력 양식 enter 제거 */
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
					$("#pageNum").val(1);
					goPage();
				});
				
				/* 양조장 등록 버튼 클릭시 처리 이벤트*/
				$("#breweryInsertBtn").click(function(){
					location.href="/admin/brewery/writeForm";
				});
				
				/* 제목 클릭시 상세페이지 이동을 위한 처리이벤트 */
				$(".goDetail").click(function(){
					let br_id = $(this).parent("tr").attr("data-num");
					$("#br_id").val(br_id);
					
					$("#detailForm").attr({
						"method":"get",
						"action":"/admin/brewery/breweryDetail"
					});
					$("#detailForm").submit();
				});
				
				/* 다음 페이지 클릭 시 */
				$(".paginate_button a").click(function(e) {
					e.preventDefault();
					$("#searchForm").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
			});//$ 종료
			
			/* 게시물 검색을 위한 함수 */
			function goPage() {
				$("#searchForm").attr({
					"method" : "get",
					"action" : "/admin/brewery/breweryList"
				});
				$("#searchForm").submit();
			}
		</script>
	<body>
	<div class="contentContainer container">
			<div class="contentTit page-header"><h2 class="text-center">양조장 관리 목록</h2></div>
			
			<form id="detailForm">
				<input type="hidden" id="br_id" name="br_id"/>
			</form>
			
			<%--================ 등록 버튼 ================= --%>
			<div class="text-left">
				<button type="button" class="btn btn-primary" id="breweryInsertBtn">양조장 등록</button>
			</div>
			
			<%-- ================= 검색기능 ================= --%>
			<div id="brewerySearch" class="text-right btnGroup">
				<form id="searchForm" name="searchForm" class="form-inline">
					<%-- 페이징 처리를 위한 파라미터 --%>
					<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" id="amount" name="amount" value="${pageMaker.cvo.amount}">
					<%-- 검색을 위한 파라미터 --%>
					<label>검색조건</label>&nbsp;
					<div class="form-group">
						<select id="search" name="search" class="form-control">
							<option value="br_name">양조장명</option>
							<option value="br_region">지역명</option>
							<option value="br_program">프로그램명</option>
						</select>
						<input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어를 입력하세요" />
						<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
					</div>
				</form>
			</div>
			
			<%--=================리스트 시작======================== --%>
			<div id="productList" class="table-height">
				<table class="table table-striped">
					<thead>
						<tr>
							<th data-value="br_id" class="order text-center col-md-1">양조장 번호</th>
							<th class="text-center col-md-2">양조장명</th>
							<th class="text-center col-md-1">지역명</th>
							<th class="text-center col-md-2">취급주종</th>
							<th class="text-center col-md-2">체험 프로그램명</th>
							<th class="text-center col-md-2">양조장 사진</th>
							<th data-value="br_date" class="order text-center col-md-2">등록일</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty breweryList}">
								<c:forEach var="br" items="${breweryList}" varStatus="status">
									<tr class="text-center" data-num="${br.br_id}">
										<td>${br.br_id}</td>
										<td class="goDetail">${br.br_name}</td>
										<td class="region">${br.br_region}</td>
										<td>${br.br_type}</td>
										<td class="program">${br.br_program}</td>
										<td>
											<c:if test="${not empty br.br_thumb}">
												<img class="listImage" src="/uploadStorage/brewery/thumbnail/${br.br_thumb}" />
											</c:if>
											<c:if test="${empty br.br_thumb}">
												<img class="listImage" src="/resources/images/common/noImage.jpg" />
											</c:if>
										</td>
										<td>${br.br_date}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" class="text-center">등록된 양조장이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<%-- 페이징 처리 커스텀태그(pagination) 정의 --%>
			<tag:pagination pageNum="${pageMaker.cvo.pageNum}" amount="${pageMaker.cvo.amount}"
							startPage="${pageMaker.startPage}" endPage="${pageMaker.endPage}"
							prev="${pageMaker.prev}" next="${pageMaker.next}" />
		</div>	
	</body>
</html>