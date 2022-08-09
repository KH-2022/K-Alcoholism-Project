<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<script type="text/javascript">
			$(function() {
				/* 수정 버튼 클릭시 처리 이벤트 */
				$("#productUpdateBtn").click(function(){
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
					
						$("#f_updateForm").attr({
							"method" : "post",
							"enctype" : "multipart/form-data",
							"action" : "/admin/product/productUpdate"
						});
						$("#f_updateForm").submit();
					}
				});
				
				/* 취소 버튼 클릭시 처리 이벤트 */
				$("#productCancelBtn").click(function(){
					$("#f_updateForm").each(function(){
						this.reset();
					});
				});
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#productListBtn").click(function(){
					location.href="/admin/product/productList";
				});
			});
		</script>
		
		
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTit page-header text-center">
				<h2>상품 관리</h2>
				<h4>상품 정보 수정</h4>
			</div>

			<div class="contentTB text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" id="pd_id" name="pd_id" value="${updateData.pd_id}" />
					<input type="hidden" id="pd_image" name="pd_image" value="${updateData.pd_image}" />
					<input type="hidden" id="pd_thumb" name="pd_thumb" value="${updateData.pd_thumb}" />

					<div class="contentBtn text-right">
						<input type="button" value="수정" id="productUpdateBtn" class="btn btn-success" />
						<input type="button" value="취소" id="productCancelBtn" class="btn btn-success" />
						<input type="button" value="목록" id="productListBtn" class="btn btn-success" />
					</div>

					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="col-md-3">글번호</td>
								<td class="col-md-3 text-left">${updateData.pd_id}</td>
								<td class="col-md-3">작성일</td>
								<td class="col-md-3 text-left">${updateData.pd_date}</td>
							</tr>
							<tr>
								<td>양조장 번호</td>
								<td colspan="3" class="text-left ">
									<input type="text" name="br_id" id="br_id" value="${updateData.br_id}" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>상품명</td>
								<td colspan="3" class="text-left ">
									<input type="text" name="pd_name" id="pd_name" value="${updateData.pd_name}" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>상품 가격</td>
								<td colspan="3" class="text-left ">
									<input type="text" name="pd_price" id="pd_price" value="${updateData.pd_price}" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>상품 분류</td>
								<td colspan="3" class="text-left ">
									<select id="pd_sort" name="pd_sort" class="form-control">
										<option value="탁주">탁주</option>
										<option value="약주/청주">약주/청주</option>
										<option value="과실주">과실주</option>
										<option value="증류주">증류주</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>상품 도수(%)</td>
								<td colspan="3" class="text-left ">
									<input type="text" name="pd_degree" id="pd_degree" value="${updateData.pd_degree}" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>상품 용량(ml)</td>
								<td colspan="3" class="text-left ">
									<input type="text" name="pd_volume" id="pd_volume" value="${updateData.pd_volume}" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>상품 정보</td>
								<td colspan="3" class="text-left"><textarea name="pd_info" id="pd_info" class="form-control" rows="8">${updateData.pd_info}</textarea></td>
							</tr>
							<tr>
								<td>이미지 파일첨부</td>
								<td colspan="3" class="text-left"><input type="file" name="file" id="file" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</body>
</html>