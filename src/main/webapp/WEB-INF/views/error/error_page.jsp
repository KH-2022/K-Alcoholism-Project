<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
		$(function() {
			/* close 인스턴스 메소드가 호출되는 즉시 실행 */
			$("#errorAlert").on("closed.bs.alert", function() {
				location.href = "/";
			});
			
			$("#main").click(function() {
				location.href = "/";
			});
		});
		</script>
		<style type="text/css">
			#errorAlert {margin-top: 300px;}
		</style>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay" style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">에러페이지</h1>
					</div>
				</div>
			</div>
		</div>
		
		<c:if test="${not empty error400}">
			<img src ="/resources/images/400.jpg" style="width: 70%; display:block; margin-left:auto; margin-right:auto;">
		</c:if>
		
		<c:if test="${not empty error403}">
			<img src ="/resources/images/403.jpg" style="width: 70%; display:block; margin-left:auto; margin-right:auto;">
		</c:if>
		
		<c:if test="${not empty error404}">
			<img src ="/resources/images/404.jpg" style="width: 70%; display:block; margin-left:auto; margin-right:auto;">
		</c:if>
		
		<c:if test="${not empty error405}">
			<img src ="/resources/images/405.png" style="width: 70%; display:block; margin-left:auto; margin-right:auto;">
		</c:if>
		
		<c:if test="${not empty error500}">
			<img src ="/resources/images/500.jpg" style="width: 70%; display:block; margin-left:auto; margin-right:auto;">
		</c:if>
		
	</body>
</html>