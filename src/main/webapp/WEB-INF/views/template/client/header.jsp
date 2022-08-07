<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="clientUri" value="${requestScope['javax.servlet.forward.request_uri']}" />
<div class="menu-bg-wrap">
	<div class="site-navigation">
		<a href="/" class="logo m-0 float-start">
			<img id="logo" src="/resources/images/common/logo_white.png" />
		</a>
		<ul class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
			<li><a href="/">전통酒의</a></li>
			<li class="has-children <c:if test="${fn:containsIgnoreCase(clientUri, '/product')}">active</c:if>">
				<a href="/product/productList">전통주 마켓</a>
				<ul class="dropdown">
					<li><a href="/product/productList">탁주</a></li>
					<li><a href="/product/productList">약주&middot;청주</a></li>
					<li><a href="/product/productList">과실주</a></li>
					<li><a href="/product/productList">증류주</a></li>
				</ul>
			</li>
			<li <c:if test="${fn:containsIgnoreCase(clientUri, '/brewery')}">class="active"</c:if>>
				<a href="/brewery/breweryList">양조장 체험</a>
			</li>
			<li <c:if test="${fn:containsIgnoreCase(clientUri, '/signUp')}">class="active"</c:if>>
				<a href="/signUp/signUpForm">회원가입</a>
			</li>
			<li <c:if test="${fn:containsIgnoreCase(clientUri, '/client/login')}">class="active"</c:if>>
				<a href="/login/login">로그인</a>
			</li>
			<li>
				<a href="#">마이페이지</a>
			</li>
			<li>
				<a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a>
			</li>
		</ul>
		<a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
			<span></span>
		</a>
	</div>
</div>