<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="adminUri" value='${requestScope["javax.servlet.forward.request_uri"]}' />

<ul class="nav nav-sidebar">
    <li><a href="#">관리자 메뉴</a></li>
    
    <li <c:if test="${fn:containsIgnoreCase(adminUri, '/admin/member')}">class="active"</c:if>>
		<a href="/admin/member/memberList">회원 관리</a>
	</li>
    
    <li <c:if test="${fn:containsIgnoreCase(adminUri, '/admin/product')}">class="active"</c:if>>
    	<a href="/admin/product/productList">상품 관리</a>
    </li>
    
    <li <c:if test="${fn:containsIgnoreCase(adminUri, '/admin/brewery')}">class="active"</c:if>>
    	<a href="/admin/brewery/breweryList">양조장 관리</a>
    </li>
</ul>