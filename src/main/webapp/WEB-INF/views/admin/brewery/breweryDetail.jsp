<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function(){
				/* 수정버튼 클릭시 처리이벤트 */
				$("#updateFormBtn").click(function(){
					$("#f_data").attr("action","/admin/brewery/updateForm")
					$("#f_data").submit();
				});
				
				/* 삭제버튼 클릭시 처리이벤트 */
				$("#boardDeleteBtn").click(function(){
					confirm("정말 삭제하시겠습니까?");
					$("#f_data").attr("action","/admin/brewery/breweryDelete")
					$("#f_data").submit();
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트*/
				$("#brListBtn").click(function(){
					location.href="/admin/brewery/breweryList";
				});
					
			});//최상위 $종료
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header"><h3 class="text-center">양조장 관리 상세</h3></div>
			
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="br_id" value="${detail.br_id}">
				<input type="hidden" name="br_image" value="${detail.br_image}" />
				<input type="hidden" name="br_thumb" value="${detail.br_thumb}" />
			</form>

			
			<%--================버튼 추가============================= --%>
			<div class="text-left">
				<input type="button" value="글수정" id="updateFormBtn" class="btn btn-success" />
				<input type="button" value="글삭제" id="boardDeleteBtn" class="btn btn-success" />
				<input type="button" value="목록" id="brListBtn" class="btn btn-success" />
			</div>
			
			<%--==============상세정보 보여주기 시작=================== --%>
			<div class="contentTB text-center">
				<table class="table table-striped">
					<tbody>
						<tr>
							<td class="text-center col-md-2">양조장아이디</td>
							<td id="productList" data-num="br_id">${detail.br_id}</td>
						</tr>
						<tr>
							<td>양조장이름</td>
							<td>${detail.br_name}</td>
						</tr>
						<tr>
							<td>양조장 지역(도)</td>
							<td>${detail.br_region}</td>
						</tr>
						<tr>
							<td>양조장주소</td>
							<td>${detail.br_addr}</td>
						</tr>
						<tr>
							<td>양조장전화번호</td>
							<td>${detail.br_tel}</td>
						</tr>
						<tr>
							<td>양조장홈페이지</td>
							<td>${detail.br_site}</td>
						</tr>
						<tr>
							<td>양조장소개</td>
							<td>${detail.br_info}</td>
						</tr>
						<tr>
							<td>양조장취급주종</td>
							<td>${detail.br_type}</td>
						</tr>
						<tr>
							<td>체험프로그램명</td>
							<td>${detail.br_program}</td>
						</tr>
						<tr>
							<td>소요시간</td>
							<td>${detail.br_time}</td>
						</tr>
						<tr>
							<td>인당체험비용</td>
							<td><fmt:formatNumber value="${detail.br_price}" type="number" var="br_price" />${br_price}원</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${detail.br_date}</td>
						</tr>
						<tr>
							<td>이미지</td>
							<c:if test="${not empty detail.br_image}">
							<td><img src="/uploadStorage/brewery/${detail.br_image}" class="img-responsive" alt="Responsive image" /></td>
							</c:if>
							<c:if test="${empty detail.br_image}">
							<td>이미지가 없습니다.</td>
							</c:if>
						</tr>
						
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>