<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function(){
				/* 검색 후 검색대상과 검색단어 초기화 방지 */
				let word = "<c:out value='${breweryVO.keyword}' />";
				let value = "";
				if (word != "") {
					$("#search").val("<c:out value='${breweryVO.search}' />");
					$("#keyword").val("<c:out value='${breweryVO.keyword}' />");
					
					/* 검색 결과에서 검색단어 글자색 변경 */
					if ($("#search").val() == "br_name") { //검색조건이 "이름"일 경우
						value = "#list tr td.goDetail";
					} else if ($("#search").val() == "br_region") { //검색조건이 "지역"일 경우
						value = "#list tr td.region";
					}
					
					$(value + ":contains('" + word + "')").each(function() { // :contains() -> 특정 텍스트를 포함한 요소 반환
						let regex = new RegExp(word, 'gi'); //g: 전역(전체)에서 / i: 대소문자 관계 없이
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
					goPage();
				});
				
				/* 양조장 등록 버튼 클릭시 처리 이벤트*/
				$("#breweryInsertBtn").click(function(){
					location.href="/admin/brewery/writeForm";
				});
				
				/*제목 클릭시 상세페이지 이동을 위한 처리이벤트*/
				$(".goDetail").click(function(){
					let br_id=$(this).parent("tr").attr("data-num");
					$("#br_id").val(br_id);
					console.log("양조장아이디 : " + br_id);
					
					$("#detailForm").attr({
						"method":"get",
						"action":"/admin/brewery/breweryDetail"
					});
					$("#detailForm").submit();
				});
				
			});//최상위 $종료	
			
			/* 게시물 검색을 위한 함수 */
			function goPage() {
				$("#searchForm").attr({
					"method" : "get",
					"action" : "/admin/product/productList"
				});
				$("#searchForm").submit();
			}
		</script>
	<body>
	<div class="contentContainer container">
			<div class="contentTit page-header"><h3 class="text-center">양조장 관리 목록</h3></div>
			
			<form id="detailForm">
				<input type="hidden" id="br_id" name="br_id"/>
			</form>
			
			<%--================버튼 추가============================= --%>
			<div class="text-left">
				<button type="button" class="btn btn-success" id="breweryInsertBtn">양조장 등록</button>
			</div>
			
			<%-- ================= 검색기능 시작 ================= --%>
			<div id="brewerySearch" class="text-right">
				<form id="searchForm" name="searchForm" class="form-inline">
					<%-- 페이징 처리를 위한 파라미터
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}"> --%>
					
					<h3><span class="label label-success">검색조건</span></h3>
					<div class="form-group">
						<select id="search" name="search" class="form-control">
							<option value="br_name">이름</option>
							<option value="br_region">지역</option>
						</select>
						<div class="form-group" id="textCheck">
							<input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어를 입력하세요" />
						</div>
						<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
					</div>
				</form>
			</div>
			<%-- ================= 검색기능 종료 ================= --%>
		
			<%--=================리스트 시작======================== --%>
			<div id="productList" class="table-height">
				<table class="table table-striped">
					<thead>
						<tr>
							<th data-value="br_id" class="order text-center col-md-1">양조장 번호</th>
							<th class="text-center">양조장 이름</th>
							<th class="text-center">양조장 지역</th>
							<th class="text-center">체험 프로그램명</th>
							<th class="text-center">양조장 사진</th>
							<th data-value="br_date" class="order text-center col-md-1">등록일</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty breweryList}">
								<c:forEach var="br" items="${breweryList}" varStatus="status">
									<tr class="text-center" data-num="${br.br_id}">
										<td>${br.br_id}</td>
										<td class="goDetail text-center">${br.br_name}</td>
										<td class="region text-center">${br.br_region}</td>
										<td class="text-center">${br.br_program}</td>
										<td>
											<c:if test="${not empty br.br_thumb}">
												<img class="listImage" src="/uploadStorage/product/thumbnail/${br.br_thumb}" />
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
									<td colspan="4" class="tac text-center">등록된 양조장이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<%-- 페이징 처리를 커스텀태그(pagination) 정의
			<tag:pagination pageNum="${pageMaker.cvo.pageNum}" amount="${pageMaker.cvo.amount}"
							startPage="${pageMaker.startPage}" endPage="${pageMaker.endPage}"
							prev="${pageMaker.prev}" next="${pageMaker.next}" />
			--%>
		</div>	
	</body>
</html>