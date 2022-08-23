<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
		$(function(){
			/* 양조장 등록 버튼 클릭시 처리 이벤트 */
			$("#brInsertBtn").click(function(){
				// 입력값 체크
				if (!chkData("#br_name", "양조장 이름을")) return;
				else if (!chkData("#br_region", "지역을")) return;
				else if (!chkData("#br_addr", "주소를")) return;
				else if (!chkData("#br_tel", "전화번호를")) return;
				else if (!chkData("#br_info", "양조장 정보를")) return;
				else if (!chkData("#br_type", "취급주종을")) return;
				else if (!chkData("#br_program", "체험 프로그램을")) return;
				else if (!chkData("#br_time", "소요시간을")) return;
				else if (!chkData("#br_price", "인당 체험비용을")) return;
				else {
					if ($("#file").val() != "") { //br_image
						if (!chkFile($("#file"))) return;
					}
					
					$("#brWriteForm").attr({
						"method" : "post",
						"enctype" : "multipart/form-data",
						"accept-charset" : "UTF-8",
						"action" : "/admin/brewery/breweryInsert"
					});
					$("#brWriteForm").submit();
				}
			});
			
			/*취소 버튼 클릭 시 처리 이벤트 */
			$("#brCancelBtn").click(function(){
				$("#brWriteForm").each(function(){
					this.reset();
				});
			});
			
			/* 목록 버튼 클릭 시 처리 이벤트*/
			$("#brListBtn").click(function(){
				location.href="/admin/brewery/breweryList";
			});
		});
	</script>
		
	</head>
	<body>
		<div class="contentContainer container">
			 <div class="contentTit page-header"><h3 class="text-center">양조장 등록</h3></div>
			 
			 <%--==============상품등록 양식보여주기 시작=================== --%>
			 <div class="contentTB text-center">
			 	<form id="brWriteForm" name="brWriteForm" class="form-horizontal">
			 		<table class="table table-bordered">
			 			<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<td>양조장 이름</td>
								<td class="text-left"><input type="text" class="form-control" id="br_name" name="br_name" /></td>
							</tr>
							<tr>
								<td>양조장 지역(도)</td>
								<td class="text-left"><input type="text" class="form-control" id="br_region" name="br_region" /></td>
							</tr>
							<tr>
								<td>양조장 주소</td>
								<td class="text-left"><input type="text" class="form-control" id="br_addr" name="br_addr" /></td>
							</tr>
							<tr>
								<td>양조장 전화번호</td>
								<td class="text-left"><input type="text" class="form-control" id="br_tel" name="br_tel" /></td>
							</tr>
							<tr>
								<td>양조장 홈페이지</td>
								<td class="text-left"><input type="text" class="form-control" id="br_site" name="br_site" /></td><%-- 필수 요소 아님 --%>
							</tr>
							<tr>
								<td>양조장 소개</td>
								<td class="text-left"><textarea name="br_info" id="br_info" class="form-control" rows="8"></textarea></td>
							</tr>
							<tr>
								<td>양조장 취급주종</td>
								<td class="text-left"><input type="text" class="form-control" id="br_type" name="br_type" /></td>
							</tr>
							<tr>
								<td>체험 프로그램명</td>
								<td class="text-left"><input type="text" class="form-control" id="br_program" name="br_program" /></td>
							</tr>
							<tr>
								<td>소요시간(분 단위) </td>
								<td class="text-left"><input type="text" class="form-control" id="br_time" name="br_time" placeholder="숫자만 입력"/></td>
							</tr>
							<tr>
								<td>인당 체험비용</td>
								<td class="text-left"><input type="text" class="form-control" id="br_price" name="br_price" placeholder="숫자만 입력"/></td>
							</tr>
							<tr>
								<td>이미지 파일 첨부</td>
								<td class="text-left"><input type="file" id="file" name="file" /></td>
							</tr>
						</tbody>
			 		</table>
			 		<div class="text-right">
						<button type="button" class="btn btn-success" id="brInsertBtn">저장</button>
						<button type="button" class="btn btn-success" id="brCancelBtn">취소</button>
						<button type="button" class="btn btn-success" id="brListBtn">목록</button>
					</div>
			 	</form>
			 </div>
		</div>	
	</body>
</html>