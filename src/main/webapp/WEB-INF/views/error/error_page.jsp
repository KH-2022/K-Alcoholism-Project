<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<title>에러 페이지</title>
		
		<link rel="shortcut icon" href="/resources/images/common/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
		
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		<style type="text/css">
			#errorAlert {margin-top: 300px;}
		</style>
		
		<script type="text/javascript" src="/resources/include/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script> 
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
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
	</head>
	<body>
		<%-- 개발 시에는 예외 메시지를 확인하기 위해 이 부분을 사용한다. 
		<h4><c:out value="${exception.getMessage()}"></c:out></h4>
		<ul>
			<c:forEach items="${exception.getStackTrace()}" var="stack">
			<li><c:out value="${stack}"></c:out></li>
			</c:forEach>
		</ul>
		--%>
	
		<%-- 개발이 완료되면 이 부분을 주석해제 하면 된다. --%>
		<div id="errorAlert" class="alert alert-danger alert-dismissible fade in" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4>예상하지 못한 오류가 발생했습니다.</h4>
			<p>
				일시적인 현상이거나 네트워크 문제일 수 있으니, 잠시 후 다시 시도해 주세요.<br />
				계속 발생하는 경우 홈페이지를 통해 문의해 주세요.<br />
				감사합니다.<br />
			</p>
			<p>
				<button type="button" id="main" class="btn btn-danger">홈으로</button>
			</p>
		</div>
	</body>
</html>