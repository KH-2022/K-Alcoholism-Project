<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<style>
			#item-template { display: none; }
		</style>
		<script type="text/javascript">
			$(function() {
				/* 기본 덧글 목록 보여주기 */
				let qna_no = ${detail.qna_no};
				listAll(qna_no);
			});
						
			/* 댓글 목록 보여주는 함수 */
			function listAll(qna_no) {
				$(".reply").detach();
				
				let url = "/qnaReply/all/" + qna_no;
				
				$.getJSON(url, function(data) {
					$(data).each(function() {
						let qna_re_no = this.qna_re_no;
						let qna_re_content = this.qna_re_content;
						let qna_re_date = this.qna_re_date;
						qna_re_content = qna_re_content.replace(/(\r\n|\r|\n)/g, "<br />");
						template(qna_re_no, qna_re_content, qna_re_date);
					});
				}).fail(function() {
					alert("덧글 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
				});
			}
		
			/* 새로운 글을 화면에 추가하기(보여주기) 위한 함수 */
			function template(qna_re_no, qna_re_content, qna_re_date) {
				let $div = $('#qnaReplyList');
				
				let $element = $('#item-template').clone().removeAttr('id');
				$element.attr("data-num", qna_re_no);
				$element.addClass("reply");
				$element.find('.panel-heading > .panel-title > .name').html("관리자");
				$element.find('.panel-heading > .panel-title > .date').html(" | " + qna_re_date);
				$element.find('.panel-body').html(qna_re_content);
				
				$div.append($element);
			}
		</script>
	</head>
	<body>
		<div id="replyContainer">
			<%-- 댓글 리스트 영역 --%>
			<div id="qnaReplyList">
				<div id="item-template" class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="name"></span>
							<span class="date"></span>
						</h3>
					</div>
					<div class="panel-body"></div>
				</div>
			</div>
		</div>
	</body>
</html>