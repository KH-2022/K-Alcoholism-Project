<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<script type="text/javascript">
		$(function(){
			/* 수정 버튼 클릭시 처리 이벤트 */
			$("#brUpdateBtn").click(function(){
				//추후 입력값 체크 기입
				
				$("#brUpdateForm").attr({
					"method" : "post",
					"enctype" : "multipart/form-data",
					"action" : "/admin/brewery/breweryUpdate"
				});
				$("#brUpdateForm").submit();
			});
			
			/* 취소 버튼 클릭시 처리 이벤트 */
			$("#brCancelBtn").click(function(){
				$("#brUpdateForm").each(function(){
					this.reset();
				});
			});
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#brListBtn").click(function(){
				location.href="/admin/brewery/breweryList";
			});
			
		});//최상위 $
		
		
	</script>
		
	</head>
	<body>
		<div class="contentContainer container">
			 <div class="contentTit page-header"><h3 class="text-center">양조장 수정</h3></div>

			 <div class="contentTB text-center">
			 	<form id="brUpdateForm" name="brUpdateForm">
			 		<input type="hidden" name="br_id" id="br_id" value="${updateData.br_id}" />
			 		<input type="hidden" name="br_image" id="br_image" value="${updateData.br_image}" />
			 		<input type="hidden" name="br_thumb" id="br_thumb" value="${updateData.br_thumb}" />
			 					 		
			 		<table class="table table-bordered">
						<tbody>
							<tr>
								<td>양조장번호</td>
								<td>${updateData.br_id}</td>
							</tr>
							<tr>
								<td>작성일</td>
								<td>${updateData.br_date}</td>
							<tr>
							<tr>
								<td>양조장이름</td>
								<td class="text-left"><input type="text" class="form-control" id="br_name" name="br_name" value="${updateData.br_name}"/></td>
							</tr>
							<tr>
								<td>양조장지역(도)</td>
								<td class="text-left"><input type="text" class="form-control" id="br_region" name="br_region" value="${updateData.br_region}"/></td>
							</tr>
							<tr>
								<td>양조장 주소</td>
								<td class="text-left"><input type="text" class="form-control" id="br_addr" name="br_addr" value="${updateData.br_addr}"/></td>
							</tr>
							<tr>
								<td>양조장 전화번호</td>
								<td class="text-left"><input type="text" class="form-control" id="br_tel" name="br_tel" value="${updateData.br_tel}"/></td>
							</tr>
							<tr>
								<td>양조장 홈페이지</td>
								<td class="text-left"><input type="text" class="form-control" id="br_site" name="br_site" value="${updateData.br_site}"/></td>
							</tr>
							<tr>
								<td>양조장 소개</td>
								<td class="text-left"><textarea name="br_info" id="br_info" class="form-control" rows="8">${updateData.br_info}</textarea></td>
							</tr>
							<tr>
								<td>양조장 취급주종</td>
								<td class="text-left"><input type="text" class="form-control" id="br_type" name="br_type"  value="${updateData.br_type}"/></td>
							</tr>
							<tr>
								<td>체험 프로그램명</td>
								<td class="text-left"><input type="text" class="form-control" id="br_program" name="br_program" value="${updateData.br_program}" /></td>
							</tr>
							<tr>
								<td>소요시간(분단위) </td>
								<td class="text-left"><input type="text" class="form-control" id="br_time" name="br_time" value="${updateData.br_time}"/></td>
							</tr>
							<tr>
								<td>인당체험비용</td>
								<td class="text-left"><input type="text" class="form-control" id="br_price" name="br_price" value="${updateData.br_price}"/></td>
							</tr>
							<tr>
								<td>이미지파일첨부</td>
								<td><input type="file" name="file" id="file"/></td>
							</tr>
						</tbody>
			 		</table>
			 		</form>
			 	</div>
			 		<div class="text-right">
						<button type="button" class="btn btn-success" id="brUpdateBtn">수정</button>
						<button type="button" class="btn btn-success" id="brCancelBtn">취소</button>
						<button type="button" class="btn btn-success" id="brListBtn">목록</button>
					</div>
			 	
			
		</div>	
	</body>
</html>