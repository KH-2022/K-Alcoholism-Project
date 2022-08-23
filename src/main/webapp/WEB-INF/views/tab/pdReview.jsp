<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function() {
				let pd_id = ${pd_id};
				listAll(pd_id);
			}); //$함수 종료
			
			/* 새로운 후기를 화면에 추가하기 위한 함수 */
			function template(pd_review_no, user_id, pd_review_content, pd_review_file, pd_review_date) {
				let $div = $("#reviewList");
				
				let $element = $("#item-template").clone().removeAttr("id"); //기존의 요소를 복제하여 동적으로 추가
				$element.attr("data-num", pd_review_no);
				$element.addClass("pdReview");
				$element.find(".panel-heading > .panel-title > .userid").html(user_id);
				$element.find(".panel-heading > .panel-title > .date").html(pd_review_date);
				$element.find(".panel-body").html(pd_review_content);
				if (pd_review_file != "") {
					let imgPath = "/uploadStorage/pdReview/" + pd_review_file;
					$element.find(".panel-img > a > img").attr("src", imgPath);
				} else {
					$element.find(".panel-img > a > img").detach();
				}
				
				$div.append($element);
			}
		
			/* 후기 목록을 불러오는 함수 */
			function listAll(pd_id) {
				$(".pdReview").detach(); //detach(): 선택한 요소를 DOM 트리에서 삭제
				
				let url = "/pdReview/" + pd_id;
				
				$.getJSON(url, function(data) { //data -> 불러온 json 데이터
					$(data).each(function() {
						let pd_review_no = this.pd_review_no;
						let user_id = this.user_id;
						let pd_review_content = this.pd_review_content;
						let pd_review_file = "";
						if (this.pd_review_file != "") {
							pd_review_file = this.pd_review_file;
						}
						let pd_review_date = this.pd_review_date;
						
						pd_review_content = pd_review_content.replace(/(\r\n|\r|\n)/g, "<br/>");
						template(pd_review_no, user_id, pd_review_content, pd_review_file, pd_review_date);
					});
				}).fail(function() {
					alert("상품 후기 목록을 불러오는 데 실패하였습니다. 잠시 후 다시 시도해 주세요.");
				});
			}
		</script>
		<style>
			#item-template {display: none;}
			.panel-img {padding: 15px;}
		</style>
	</head>
	<body>
		<div id="reviewList">
			<div id="item-template" class="panel">
				<div class="panel-heading">
					<h3 class="panel-title">
						<span class="userid text-primary"></span>&nbsp;
						<small class="date"></small>
					</h3>
				</div>
				<div class="panel-body"></div>
				<div class="panel-img">
					<a><img class="review-img" /></a>
				</div>
			</div>
		</div>
	</body>
</html>