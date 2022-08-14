<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function() {
				let deleteMsg = "${deleteMsg}";
				if (deleteMsg != "") {
					alert(deleteMsg);
					deleteMsg = "";
				}
				
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
			<div id="reserveSearch" class="text-right">
				<form id="searchForm" name="searchForm" class="form-inline">
					<%-- 페이징 처리를 위한 파라미터 --%>
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
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
										<td>${member.user_no}</td>
										<td><span class="goDetail">${member.user_id}</span></td>
										<td>${member.user_name}</td>
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