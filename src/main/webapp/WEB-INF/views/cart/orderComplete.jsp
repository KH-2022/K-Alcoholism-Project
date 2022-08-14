<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<style type="text/css">
			.complete{
				margin : 100px;
				padding : 100px;
				font-size: xx-large;
			}
			#mainBtn{margin-top : 30px;}
		</style>
		<script type="text/javascript">
			$(function() {
				/* 메인페이지로 이동 버튼 클릭시 처리이벤트 */
				$("#mainBtn").click(function(){
					location.href = "/";
				});
			});//최상위
		</script>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">전통주 마켓</h1>
					</div>
				</div>
			</div>
		</div>
		
		<div class="section">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<div class="col-lg-6 text-center mx-auto">
						<h2 class="complete font-weight-bold text-primary heading">주문이 완료되었습니다.</h2>
						<button type="button" id="mainBtn" class="btn btn-primary btn-lg">메인페이지로 이동</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>