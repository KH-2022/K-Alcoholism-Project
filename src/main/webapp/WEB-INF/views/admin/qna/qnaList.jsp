<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<style type="text/css">
			.reply-count {font-size: 11px; color: red;}
		</style>
		<script type="text/javascript">
			$(function() {
				/* 검색 후 검색 대상과 검색 단어 출력 */
				let word = "<c:out value='${qnaVO.keyword}'/>";
				let value = "";
				if(word != "") {
					$("#keyword").val("<c:out value='${qnaVO.keyword}' />");
					$("#search").val("<c:out value='${qnaVO.search}' />");
					
					if($("#search").val()!='qna_content') {
						if($("#search").val()=='qna_title') value="#list tr td.goDetail";
						else if($("#search").val()=='user_id') value="#list tr td.name";
						$(value+":contains('"+word+"')").each(function() {
							let regex = new RegExp(word, 'gi');
							$(this).html($(this).html().replace(regex, "<span class='required'>"+word+"</span>"));
						});
					}
				}
				
				/* 입력 양식 enter 제거 */
				$("#keyword").bind("keydown", function(event) {
					if(event.keyCode == 13) {
						event.preventDefault();
					}
				});
				
				/* 검색 대상이 변경될 때마다 처리 이벤트 */
				$("#search").change(function() {
					if($("#search").val() == "all") {
						$("#keyword").val("전체 데이터 조회합니다.");
					} else if($("#search").val() != "all") {
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				/* 검색 버튼 클릭 시 처리 이벤트 */
				$("#searchBtn").click(function() {
					if($("#search").val() != "all") {
						if(!chkData("#keyword", "검색어를")) return;
					}
					$("#pageNum").val(1);
					goPage();
				});
				
				/* 글쓰기 버튼 클릭 시 처리 이벤트 */
				$("#insertFormBtn").click(function() {
					location.href = '/admin/qna/writeForm';
				});
				
				/* 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 */
				$(".goDetail").click(function() {
					let qna_no = $(this).parents("tr").attr("data-num");
					$("#qna_no").val(qna_no);

					$("#detailForm").attr({
						"method": "get",
						"action": "/admin/qna/qnaDetail"
					});
					$("#detailForm").submit();
				});
				
				/* 페이징처리 */
				$(".paginate_button a").click(function(e) {
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
			}); // $ 함수 종료
			
			/* 검색을 위한 실질적인 처리 함수 */
			function goPage() {
				if($("#search").val() == "all") {
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method" : "get",
					"action" : "/admin/qna/qnaList"
				});
				$("#f_search").submit();
			}
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header"><h2 class="text-center">문의게시판 목록</h2></div>
		
			<form id="detailForm">
				<input type="hidden" id="qna_no" name="qna_no" />
			</form>
			
			<%-- ================= 검색기능 ================= --%>
			<div id="qnaSearch" class="text-right btnGroup">
				<form id="searchForm" name="searchForm" class="form-inline">
					<%-- 페이징 처리를 위한 파라미터 --%>
					<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" id="amount" name="amount" value="${pageMaker.cvo.amount}">
					<%-- 검색을 위한 파라미터 --%>
					<label>검색조건</label>&nbsp;
					<div class="form-group">
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="qna_title">제목</option>
							<option value="qna_content">내용</option>
							<option value="user_id">작성자</option>
						</select>
						<input type="text" name="keyword" id="keyword" class="form-control" placeholder="검색어를 입력하세요" />
						<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
					</div>
				</form>
			</div>
			 
			<%--=================리스트 ======================== --%>
			<div id="qnaList" class="table-height">
				<table class="table table-striped">
					<thead>
						<tr>
							<th data-value="qna_no" class="order text-center col-md-1">번호</th>
							<th class="text-center col-md-5">제목</th>
							<th class="text-center col-md-4">작성자</th>
							<th data-value="qna_date" class="order text-center col-md-2">등록일</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty qnaList}">
								<c:forEach var="qna" items="${qnaList}" varStatus="status">
									<tr class="text-center" data-num="${qna.qna_no}">
										<td>${qna.qna_no}</td>
										<td class="goDetail">${qna.qna_title}
											<c:if test="${qna.qna_replycnt > 0}">&nbsp;<span class="reply-count">[${qna.qna_replycnt}]</span></c:if>
										</td>
										<td>${qna.user_id}</td>
										<td>${qna.qna_date}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="text-center">등록된 게시글이 존재하지 않습니다.</td>
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