<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function() {
				let deleteMsg = "${deleteMsg}";
				if (deleteMsg != "") {
					alert(deleteMsg);
					deleteMsg = "";
				}
				
				/* 검색 후 검색대상과 검색단어 초기화 방지 */
				let word = "<c:out value='${data.keyword}' />";
				let value = "";
				if (word != "") {
					$("#keyword").val("<c:out value='${data.keyword}' />");
					$("#search").val("<c:out value='${data.search}' />");
					
					console.log(search + ", " + keyword);
					
					/* 검색 결과에서 검색단어 글자색 변경 */
					if ($("#search").val() == "user_no") { 
						value = "#list tr td.user_no";
					} else if ($("#search").val() == "user_id") { 
						value = "#list tr td.user_id";
					} else if ($("#search").val() == "user_name") { 
						value = "#list tr td.user_name";
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
					if($("#search").val()=="all"){
						$("#keyword").val("전체 데이터를 조회 합니다.");
					} else if($("#search").val() !="all"){
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				/* 검색 버튼 클릭 시 */
				$("#searchBtn").click(function() {
					if($("#search").val() != "all"){
						if (!chkData("#keyword", "검색어를")) return;
					}
					$("#pageNum").val(1);
					goPage();
				});
				
				$(".memberDeleteBtn").click(function() {
					var delete_yn = $(this).parents("tr").attr("data-yn");
					
					if(delete_yn == 'Y'){
						alert("이미 탈퇴된 회원입니다.");
						return false;
					} 
						
					if(confirm("정말 회원을 탈퇴시키겠습니까?")) { //확인:true, 취소:false 
						let user_no = $(this).parents("tr").attr("data-no");	
						$("#user_no").val(user_no);
						
						$("#memberDeleteForm").attr({
							"method" : "post",
							"action" : "/admin/member/memberDelete"
						});
						$("#memberDeleteForm").submit();
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
				if($("#search").val() == "all"){
					$("#keyword").val("");
				}
				$("#searchForm").attr({
					"method" : "get",
					"action" : "/admin/member/memberList"
				});
				$("#searchForm").submit();
			}
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header"><h2 class="text-center">회원 관리 목록</h2></div>
			
			<%-- ================= 탈퇴를 위한 form================= --%>
			<form id="memberDeleteForm" name="memberDeleteForm">
					<input type="hidden" id="user_no" name="user_no" />
			</form>
			<%-- ================= 탈퇴를 위한 form================= --%>
			
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
							<option value="all">전체</option>
							<option value="user_no">회원번호</option>
							<option value="user_id">아이디</option>
							<option value="user_name">회원명</option>
						</select>
						<input type="text" id="keyword" name="keyword" class="form-control" placeholder="검색어를 입력하세요" />
						<button type="button" class="btn btn-primary" id="searchBtn">검색</button>
					</div>
				</form>
			</div>
			<%-- ================= 검색기능 종료 ================= --%>
		
			<%-- ================= 회원정보 리스트 ================= --%>
			<div id="List" class="table-height">
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="text-center col-md-1">회원번호</th>
							<th class="text-center col-md-2">회원아이디</th>
							<th class="text-center col-md-1">회원명</th>
							<th class="text-center col-md-2">회원이메일</th>
							<th class="text-center col-md-2">회원핸드폰</th>
							<th class="text-center col-md-2">등록일</th>
							<th class="text-center col-md-1">탈퇴여부</th>
							<th class="text-center col-md-1">강제탈퇴</th>
						</tr>
					</thead>
					
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty memberList}">
								<c:forEach var="member" items="${memberList}" varStatus="status">
								
									<tr class="text-center" data-no="${member.user_no}" data-yn="${member.delete_YN}">
										<td class="user_no">${member.user_no}</td>
										<td class="goDetail user_id">${member.user_id}</td>
										<td class="user_name">${member.user_name}</td>
										<td>${member.user_email}</td>
										<td>${member.user_tel}</td>
										<td>${member.user_date}</td> 
										<td>${member.delete_YN}</td> 
										<td>
											<button type="button" class="btn btn-success memberDeleteBtn">탈퇴</button>
										</td> 
									</tr>
									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8" class="text-center">등록된 회원정보가 존재하지 않습니다.</td>
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