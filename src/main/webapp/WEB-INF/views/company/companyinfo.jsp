<%@include file="/WEB-INF/views/include/cheader.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<style>
</style>
</head>
<body>
	<!-- 사이드 바 -->
	<div class="container d-flex">
		<div class="list-group mx-2">
			<a href="/Company/CInfo?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item   shadow" style="width: 150px;">회사정보</a> <a
				href="/Company/PostForm?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item hs_list_effect shadow">공고관리</a> <a
				href="/Company/SupportedList?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item shadow">받은 이력서 관리</a> <a href="#"
				class="list-group-item shadow">스크랩</a>
		</div>
	<!-- 페이지 내용 -->
	<div class=" mx-2 pb-4 w-100">
		<div class=" border border-tertiary p-5 rounded shadow">
			<div class="col-sm-9 page">
				<div class="d-flex justify-content-center">
					<img src="/img/face.jpg" id="imagePreview"
						class="mb-2 border border-tertiary"
						style="width: 100px; height: 100px;">

					<form>

						<div class="input-group mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">이메일</span>
							<input type="email" class="form-control"
								name="com_id" value="${sessionScope.clogin.com_id }" readonly>
						</div>

						<div class="input-group mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">회사명</span>
							<input type="text" class="form-control" name="com_name" value="${vo.com_name }"
								readonly>
						</div>

						<div class="input-group mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">사업자등록증</span>
							<input type="text" class="form-control" name="com_num" value="${vo.com_num }"
								readonly>
						</div>

						<div class="form-floating mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">대표자명</span>
							<input type="text" class="form-control" name="com_boss" value="${ vo.com_boss }"
								readonly>
						</div>
						<div class="form-floating mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">회사주소</span>
							<input type="text" class="form-control" name="com_adr" value="${vo.com_adr }"
								readonly>
						</div>
						<div class="form-floating mb-3">
							<span
								class="input-group-text justify-content-center hs_span_size init_color hs_span">전화번호</span>
							<input type="text" class="form-control" name="com_tell" value="${vo.com_tell }"
								readonly>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>
	

</body>
<script>
   
   </script>
</html>