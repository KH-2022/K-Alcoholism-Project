<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function(){
				$("#brReplyDeleteBtn").click(function() {
					if(confirm("정말 삭제하시겠습니까?")) {
						$("#f_data").attr({
							"method" : "post",
							"action" : "/admin/reply/brReplyDelete"
						});
						$("#f_data").submit();
					} else {
						return;
					} 
				});
				
				$("#replyListBtn").click(function(){
					location.href="/admin/reply/replyList";
				});
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header text-center">
				<h2>양조장 리뷰 상세</h2>
			</div>
			
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="br_review_no" value="${detail.br_review_no}">
				<input type="hidden" name="br_review_image" value="${detail.br_review_file}" />
				<input type="hidden" name="br_review_thumb" value="${detail.br_review_thumb}" />
			</form>
			
			<%-- 버튼 --%>
			<div class="btnGroup text-right">
				<input type="button" value="리뷰 삭제" id="brReplyDeleteBtn" class="btn btn-primary" />
				<input type="button" value="양조장 리뷰 목록" id="replyListBtn" class="btn btn-primary" />
			</div>
			
			<%--==============상세정보 보여주기 시작=================== --%>
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<tr>
						<td class="col-md-3">체험 리뷰 번호</td>
						<td class="col-md-3 text-left" data-num="br_review_no">${detail.br_review_no}</td>
						<td class="col-md-3">양조장명</td>
						<td class="col-md-3 text-left">${detail.br_name}</td>
					</tr>
					<tr>
						<td class="col-md-3">회원 아이디</td>
						<td class="col-md-3 text-left">${detail.user_id}</td>
						<td class="col-md-3">작성일</td>
						<td class="col-md-3 text-left">${detail.br_review_date}</td>
					</tr>
					<tr>
						<td class="col-md-3">리뷰 내용</td>
						<td colspan="3" class="col-md-9">${detail.br_review_content}</td>
					</tr>
					<tr>
						<td class="col-md-3">리뷰 사진</td>
						<td colspan="3" class="col-md-9">
							<c:if test="${not empty detail.br_review_file}">
								<img class="detail-img" src="/uploadStorage/brReview/${detail.br_review_file}" />
							</c:if>
							<c:if test="${empty detail.br_review_file}">
								<img class="img-responsive" src="/resources/images/common/noImage.jpg" />
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>