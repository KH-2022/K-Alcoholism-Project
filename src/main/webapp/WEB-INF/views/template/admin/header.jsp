<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/admin/member/memberList"><strong>전통주의</strong> 관리자페이지</a>
		<div class="inline navbar-brand">
			<c:if test="${not empty adminLogin}">
				${adminLogin.admin_name}<small>관리자님 반갑습니다.</small>
				<a href="/admin/logout" class="btn btn-primary btn-sm active" role="button">로그아웃</a>
			</c:if>
			<c:if test="${empty adminLogin}">
				<script type="text/javascript">
					location.href="/admin/login";
				</script>
			</c:if>
		</div>
	</div>
</div>