<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<script type="text/javascript">
			$(function(){
				/* 상품 등록 버튼 클릭시 처리 이벤트 */
				$("#pdInsertBtn").click(function(){
					// 입력값 체크\
					if (!chkData("#br_id", "양조장 번호를")) return;
					else if (!chkData("#pd_name", "상품 이름을")) return;
					else if (!chkData("#pd_price", "가격을")) return;
					else if (!chkData("#pd_sort", "분류를")) return;
					else if (!chkData("#pd_degree", "도수를")) return;
					else if (!chkData("#pd_volume", "용량을")) return;
					else if (!chkData("#pd_info", "정보를")) return;
					else {
						if ($("#file").val() != "") { //pd_image
							if (!chkFile($("#file"))) return;
						}
						
						$("#pdWriteForm").attr({
							"method" : "post",
							"enctype" : "multipart/form-data",
							"accept-charset" : "UTF-8",
							"action" : "/admin/product/productInsert"
						});
						$("#pdWriteForm").submit();
					}
				});
				
				/*취소 버튼 클릭 시 처리 이벤트 */
				$("#pdCancelBtn").click(function(){
					$("#pdWriteForm").each(function(){
						this.reset();
					});
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트*/
				$("#pdListBtn").click(function(){
					location.href="/admin/product/productList";
				});
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header text-center">
				<h2>상품 관리</h2>
				<h4>상품 등록</h4>
			</div>
			 
			 <%-- ===================== 상품등록 양식 ===================== --%>
			 <div class="contentTB text-center">
			 	<form id="pdWriteForm" name="pdWriteForm" class="form-horizontal">
			 		
			 		<%-- ===================== 버튼 추가 ===================== --%>
			 		<div class="text-right">
						<button type="button" class="btn btn-success" id="pdInsertBtn">저장</button>
						<button type="button" class="btn btn-success" id="pdCancelBtn">취소</button>
						<button type="button" class="btn btn-success" id="pdListBtn">목록</button>
					</div>
					
			 		<table class="table table-bordered">
			 			<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<td>양조장 번호</td>
								<td class="text-left"><input type="text" class="form-control" id="br_id" name="br_id" /></td>
							</tr>
							<tr>
								<td>상품명</td>
								<td class="text-left"><input type="text" class="form-control" id="pd_name" name="pd_name" /></td>
							</tr>
							<tr>
								<td>상품 가격</td>
								<td class="text-left"><input type="text" class="form-control" id="pd_price" name="pd_price" /></td>
							</tr>
							<tr>
								<td>상품 분류</td>
								<td>
									<select id="pd_sort" name="pd_sort" class="form-control">
										<option value="탁주">탁주</option>
										<option value="약주/청주">약주/청주</option>
										<option value="과실주">과실주</option>
										<option value="증류주">증류주</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>상품 도수</td>
								<td class="text-left"><input type="text" class="form-control" id="pd_degree" name="pd_degree" /></td>
							</tr>
							<tr>
								<td>상품 용량(ml 단위)</td>
								<td class="text-left"><input type="text" class="form-control" id="pd_volume" name="pd_volume" /></td>
							</tr>
							<tr>
								<td>상품 정보</td>
								<td class="text-left"><textarea name="pd_info" id="pd_info" class="form-control" rows="8"></textarea></td>
							</tr>
							<tr>
								<td>이미지 파일 첨부</td>
								<td class="text-left"><input type="file" id="file" name="file" /></td> <!-- ProductVO private MultipartFile file 과 name=file 일치 -->
							</tr>
						</tbody>
			 		</table>
			 		
			 	</form>
			 </div>
		</div>	
	</body>
</html>