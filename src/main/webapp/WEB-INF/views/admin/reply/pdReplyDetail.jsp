<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function(){
				$("#pdReplyDeleteBtn").click(function() {
					if(confirm("정말 삭제하시겠습니까?")) {
						$("#f_data").attr({
							"method" : "post",
							"action" : "/admin/reply/pdReplyDelete"
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
				<h2>전통주 리뷰 상세</h2>
			</div>
			
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="pd_review_no" value="${detail.pd_review_no}">
				<input type="hidden" name="pd_review_image" value="${detail.pd_review_file}" />
				<input type="hidden" name="pd_review_thumb" value="${detail.pd_review_thumb}" />
			</form>

			
			<%--================버튼 추가============================= --%>
			<div class="text-left">
				<input type="button" value="글삭제" id="pdReplyDeleteBtn" class="btn btn-success" />
				<input type="button" value="목록" id="replyListBtn" class="btn btn-success" />
			</div>
			
			<%--==============상세정보 보여주기 시작=================== --%>
			<div class="contentTB text-center">
				<table class="table table-striped">
					<tbody>
						<tr>
							<td class="text-center col-md-2">상품 리뷰번호</td>
							<td data-num="pd_review_no">${detail.pd_review_no}</td>
						</tr>
						<tr>
							<td>제품명</td>
							<td>${detail.pd_name}</td>
						</tr>
						<tr>
							<td>회원 아이디</td>
							<td>${detail.user_id}</td>
						</tr>
						<tr>
							<td>리뷰 내용</td>
							<td>${detail.pd_review_content}</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${detail.pd_review_date}</td>
						</tr>
						<tr>
							<td>리뷰 사진</td>
							<td>
							<c:if test="${not empty detail.pd_review_file}">
								<img src="/uploadStorage/pdReview/${detail.pd_review_file}" />
							</c:if>
							<c:if test="${empty detail.pd_review_file}">
								<img class="img-responsive" src="/resources/images/common/noImage.jpg" />
							</c:if>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>