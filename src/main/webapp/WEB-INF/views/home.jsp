<%@include file="/WEB-INF/views/include/pheader.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.select_box {
	display: flex;
	justify-content: center; /* 가로로 중앙 정렬 */
	align-items: center; /* 세로로 중앙 정렬 */
	flex-wrap: wrap; /* 내용이 넘칠 경우 다음 줄로 이동 */
	gap: 10px; /* 자식 요소들 사이의 간격 */
}
</style>
</head>
<body>
	<!-- 옵션바 -->
	<div class="select_box jm_select_box mt-5">
		<select id="skill" name="skill" class="jm_select selectpicker"
			data-style="btn-info" >
			<option value="none" selected>분야</option>
			<option value="JavaScript">JavaScript</option>
			<option value="TypeScript">TypeScript</option>
			<option value="Java">Java</option>
			<option value="Python">Python</option>
			<option value="C#">C#</option>
			<option value="Kotlin">Vue.js</option>
			<option value="MySQL">MySQL</option>
			<option value="MongoDB">MongoDB</option>
			<option value="GitHub">GitHub</option>
			<option value="Swift">Swift</option>
			<option value="Django">Django</option>
		</select> <select id="career" class="jm_select">
			<option value="none" selected>고용형태</option>
			<option value="신입">신입</option>
			<option value="경력">경력</option>
		</select> <select id="region" class="jm_select">
			<option value="none" selected>근무지</option>
			<option value="서울">서울</option>
			<option value="부산">부산</option>
			<option value="대구">대구</option>
			<option value="인천">인천</option>
			<option value="광주">광주</option>
			<option value="대전">대전</option>
			<option value="울산">울산</option>
			<option value="강원도">강원도</option>
			<option value="세종">세종</option>
			<option value="제주">제주</option>
		</select>
	</div>
	<!-- 채용 공고 -->
	<div class="container jm_container mt-5">
		<div class="row row-cols-3 g-4 d-flex flex-wrap">
			<c:forEach items="${ postList }" var="Vo" varStatus="status">
				<div class="col-xs-4 post">
					<a href="/Users/View?po_num=${ Vo.po_num }"
						style="color: inherit; text-decoration: none;">
						<div class="card jm_card h-100">
							<img src="/Company/Images?com_id=${ Vo.com_id }"
								class="card-img-top jm_card_img_top">
							<div class="card-body jm_card_body">
								<div class="jm_company_title">${ Vo.po_title}</div>

								<div class="jm_company_address">${post.address}</div>
								<div class="jm_D-day d-flex justify-content-between">
									<div id="dDay-${status.count}"></div>

									<button type="button" class="btn btn-sm"
										onclick="scrapOrCancle(event, ${post.postId})">
										<c:choose>
											<c:when test="${post.scrap == 0}">
												<i class="fa-regular text-secondary fa-thumbs-up fa-2xl"
													id="scrap-${post.postId}" value="${post.scrap}"></i>
											</c:when>

											<c:otherwise>
												<i class="fa-solid scrap_icon fa-thumbs-up fa-2xl"
													id="scrap-${post.postId}" value="${post.scrap}"></i>
											</c:otherwise>
										</c:choose>
									</button>
								</div>
							</div>
						</div>
					</a> <input type="hidden" value="${post.deadline}" name=""
						class="deadline" id="deadline-${status.count}" />
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script>
	document.addEventListener('DOMContentLoaded', function() {
	    document.getElementById('skill').addEventListener('change', function() {
	        filterPosts();
	    });
	});
	
	function filterPosts() {
	    const selectedSkill = document.querySelector('#skill>option:checked').value
	    const url = '/Filter/GetSkill';
	    const params = {
	        method: 'POST',
	        headers: {"Content-Type": "application/json"},
	        body: JSON.stringify({ skill : selectedSkill })
	    };
	    fetch(url, params)
	        .then(response => response.json())
	        .then(json =>{
	        	console.log(json)
	        })
	        .catch(error => {
	            console.error('에러:', error);
	            alert('요청을 처리하는 중 문제가 발생했습니다.');
	        });
	}

</script>

</html>