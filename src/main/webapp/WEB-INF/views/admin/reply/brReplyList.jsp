<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function() {
				let sendMsg = "${sendMsg}";
				if (sendMsg != "") {
					alert(sendMsg);
					sendMsg = "";
				}
				
				/* 검색 후 검색대상과 검색단어 초기화 방지 */
				let word = "<c:out value='${data.keyword}' />";
				let value = "";
				if (word != "") {
					$("#keyword").val("<c:out value='${data.keyword}' />");
					$("#search").val("<c:out value='${data.search}' />");
					
					console.log(search + ", " + keyword);
					
					/* 검색 결과에서 검색단어 글자색 변경 */
					if ($("#search").val() == "br_name") { //검색조건이 "양조장명"일 경우
						value = "#list tr td.br_name";
					} else if ($("#search").val() == "user_id") { //검색조건이 "회원아이디"일 경우
						value = "#list2 tr td.user_id";
					}
					console.log($(value+":contains('"+word+"')").html());
					
					$(value + ":contains('" + word + "')").each(function() {
						let regex = new RegExp(word, 'gi');
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
				$("#search").change(function(){
					$("#keyword").val("");
					$("#keyword").focus();
				});
				
				/* 검색 버튼 클릭 시 */
				$("#searchBtn").click(function() {
					if (!chkData("#keyword", "검색어를")) return;
					$("#pageNum").val(1);
					goPage();
				});
				
				$(".goDetail").click(function() {
					let br_review_no = $(this).parents("tr").attr("data-num");
					$("#br_review_no").val(br_review_no);
					
					$("#replyDetailForm").attr({
						"method" : "get",
						"action" : "/admin/reply/brReplyDetail"
					});
					$("#replyDetailForm").submit();
				});
				
				$(".brReplyDelete").click(function() {
					if(confirm("정말 삭제하시겠습니까?")) {
						let br_review_no = $(this).parents("tr").attr("data-num");
						$("#br_review_no").val(br_review_no);
						
						$("#replyDetailForm").attr({
							"method" : "post",
							"action" : "/admin/reply/brReplyDelete"
						});
						$("#replyDetailForm").submit();
					} else {
						return;
					} 
				});
				
				/* 다음 페이지 클릭 시 */
				$(".paginate_button a").click(function(e) {
					e.preventDefault();
					$("#searchForm").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
			}); //$함수 종료
			
			function goPage() {
				$("#searchForm").attr({
					"method" : "get",
					"action" : "/admin/reply/brReplyList"
				});
				$("#searchForm").submit();
			}
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header"><h2 class="text-center">체험 리뷰 관리 목록</h2></div>
			
			<form id="replyDetailForm">
				<input type="hidden" id="br_review_no" name="br_review_no"/>
			</form>
			
			<%-- ================= 검색기능 시작 ================= --%>
			<div id="replySearch" class="text-right btnGroup">
				<form id="searchForm" name="searchForm" class="form-inline">
					<%-- 페이징 처리를 위한 파라미터 --%>
					<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
					<%-- 검색을 위한 파라미터 --%>
					<label>검색조건</label>&nbsp;
					<div class="form-group">
						<select id="search" name="search" class="form-control">
							<option value="br_name">양조장명</option>
							<option value="user_id">회원 ID</option>
						</select>
						<input type="text" id="keyword" name="keyword" class="form-control" placeholder="검색어를 입력하세요" />
						<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
					</div>
				</form>
			</div>
			<%-- ================= 검색기능 종료 ================= --%>
		
			<%-- ================= 후기정보 리스트 ================= --%>
			<div id="replyList" class="table-height">
				<table class="table table-striped">
					<thead>
						<tr>
							<th data-value="br_review_no" class="order text-center col-md-1">리뷰 번호</th>
							<th class="text-center col-md-2">리뷰 사진</th>
							<th class="text-center col-md-2">양조장</th>
							<th class="text-center col-md-1">회원 ID</th>
							<th class="text-center col-md-3">리뷰 내용</th>
							<th class="text-center col-md-2">작성일</th>
							<th class="text-center col-md-1">삭제</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty brReplyList}">
								<c:forEach var="br" items="${brReplyList}" varStatus="status">
									<tr class="text-center" data-num="${br.br_review_no}">
										<td class="goDetail"><strong>${br.br_review_no}</strong></td>
										<td>
											<c:if test="${not empty br.br_review_thumb}">
												<img class="listImage" src="/uploadStorage/brReview/thumbnail/${br.br_review_thumb}" />
											</c:if>
											<c:if test="${empty br.br_review_thumb}">
												<img class="listImage" src="/resources/images/common/noImage.jpg" />
											</c:if>
										</td>
										<td class="br_name">${br.br_name}</td>
										<td class="user_id">${br.user_id}</td>
										<td>${br.br_review_content}</td>
										<td>${br.br_review_date}</td>
										<td>
											<a href="javascript:void(0);" class="brReplyDelete" >삭제</a>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" class="text-center">양조장 체험 리뷰가 존재하지 않습니다.</td>
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