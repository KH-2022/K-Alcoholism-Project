<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="adminUri" value='${requestScope["javax.servlet.forward.request_uri"]}' />
<ul class="nav nav-sidebar">
    <li <c:if test="${fn:containsIgnoreCase(adminUri, '/admin/member')}">class="active"</c:if>>
		<a href="/admin/member/memberList">회원 관리</a>
	</li>
    <li <c:if test="${fn:containsIgnoreCase(adminUri, '/admin/qna')}">class="active"</c:if>>
    	<a href="/admin/qna/qnaList">문의게시판 관리</a>
    </li>
</ul>
<ul class="nav nav-sidebar">
	<li <c:if test="${fn:containsIgnoreCase(adminUri, '/admin/product')}">class="active"</c:if>>
    	<a href="/admin/product/productList">상품 관리</a>
    </li>
    <li <c:if test="${fn:containsIgnoreCase(adminUri, '/admin/order')}">class="active"</c:if>>
		<a href="/admin/order/orderList">상품 주문 관리</a>
	</li>
	<li <c:if test="${fn:containsIgnoreCase(adminUri, '/admin/reply/pdReplyList')}">class="active"</c:if>
		<c:if test="${fn:containsIgnoreCase(adminUri, '/admin/reply/pdReplyDetail')}">class="active"</c:if>>
		<a href="/admin/reply/pdReplyList">상품 리뷰 관리</a>
	</li>
</ul>
<ul class="nav nav-sidebar">
	<li <c:if test="${fn:containsIgnoreCase(adminUri, '/admin/brewery')}">class="active"</c:if>>
    	<a href="/admin/brewery/breweryList">양조장 관리</a>
    </li>
    <li <c:if test="${fn:containsIgnoreCase(adminUri, '/admin/reserve')}">class="active"</c:if>>
    	<a href="/admin/reserve/reserveList">체험 예약 관리</a>
    </li>
    <li <c:if test="${fn:containsIgnoreCase(adminUri, '/admin/reply/brReplyList')}">class="active"</c:if>
    	<c:if test="${fn:containsIgnoreCase(adminUri, '/admin/reply/brReplyDetail')}">class="active"</c:if>>
		<a href="/admin/reply/brReplyList">체험 리뷰 관리</a>
	</li>
</ul>