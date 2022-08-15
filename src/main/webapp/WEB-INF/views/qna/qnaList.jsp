<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
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
					location.href = '/qna/writeForm';
					
					/* 로그인 사용자 처리 */
					let loginName = "${user_id}";
					if(loginName != user_id) {
						$element.find('#insertFormBtn').detach();
					}
				});
				
				/* 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 */
				$(".goDetail").click(function() {
					let qna_no = $(this).parents("tr").attr("data-num");
					$("#qna_no").val(qna_no);

					$("#detailForm").attr({
						"method": "get",
						"action": "/qna/qnaDetail"
					});
					$("#detailForm").submit();
				});
				
				/* 페이징 처리 */
				$(".paginate_button a").click(function(e) {
					e.preventDefault();
					$("#searchForm").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				})
				
			}); // $ 함수 종료
			
			/* 검색을 위한 실질적인 처리 함수 */
			function goPage() {
				if($("#search").val() == "all") {
					$("#keyword").val("");
				}
				$("#searchForm").attr({
					"method" : "get",
					"action" : "/qna/qnaList"
				});
				$("#searchForm").submit();
			}
			
			/* 로그인 사용자 처리 */
			let loginName = "${qna.user_id}";
			if(loginName != "${qna.user_id}") {
				$element.find(".contentBtn > input[type='button']").detach();
				console.log("로그인 성공");
			}
		</script>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">1:1 문의</h1>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 페이지 인포 --%>
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-lg-6 text-center mx-auto">
						<h2 class="font-weight-bold text-primary heading">문의게시판 목록</h2>
					</div>
				</div>
				
				<form id="detailForm">
					<input type="hidden" id="qna_no" name="qna_no" />
				</form>
				
				<%-- ================= 글쓰기 버튼 ================= --%>
				<div class="form-group text-right">
					<button type="button" id="insertFormBtn" class="btn btn-primary">글쓰기</button>
				</div>
				
				<%-- 검색 기능 --%>
				<div class="row text-left">
					<form id="searchForm" name="searchForm" class="form-inline">
						<%-- 페이징 처리를 위한 파라미터 --%>
						<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cvo.pageNum}">
						<input type="hidden" id="amount" name="amount" value="${pageMaker.cvo.amount}">
						<%-- 검색을 위한 파라미터 --%>
						<label>검색조건</label>&nbsp;
						<div class="form-group">
							<select id="search" name="search">
								<option value="all">전체</option>
								<option value="qna_title">제목</option>
								<option value="qna_content">내용</option>
								<option value="user_id">작성자</option>
							</select>
							<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control search-keyword" />
							<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	
		<%--============ 문의게시판 리스트 시작===================== --%>
		<div class="container">
			<div id="qnaList" class="table-height">
				<table summary="게시판 리스트" class="table table-striped">
					<thead>
						<tr>
							<th data-value="qna_no" class="text-center col-md-1">번호</th>
							<th class="text-center col-md-5">글제목</th>
							<th class="text-center col-md-3">작성자</th>
							<th data-value="qna_date" class="text-center col-md-2">작성일</th>
							<th class="text-center col-md-1">조회수</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty qnaList}">
								<c:forEach var="qna" items="${qnaList}" varStatus="status">
									<tr data-num="${qna.qna_no}">
										<td class="text-center">${qna.qna_no}</td>	
										<td class="goDetail">${qna.qna_title}
											<c:if test="${qna.qna_replycnt > 0}">&nbsp;<span class="reply_count">[${qna.qna_replycnt}]</span></c:if>
										</td>	
										<td class="name text-center">${qna.user_id}</td>
										<td class="text-center">${qna.qna_date}</td>
										<td class="text-center">${qna.qna_readcnt}</td>	
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" class="text-center">등록된 게시글이 존재하지 않습니다.</td>	
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<%-- 페이징 처리 커스텀태그(pagination)를 정의 --%>
			<tag:pagination pageNum="${pageMaker.cvo.pageNum}" amount="${pageMaker.cvo.amount}"
							startPage="${pageMaker.startPage}" endPage="${pageMaker.endPage}"
							prev="${pageMaker.prev}" next="${pageMaker.next}" />
		</div>
	</body>
</html>