<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<!-- 부트스트랩 CDN 링크 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>

/* 본문 */
.page {
	margin: 0;
	/* margin-top: 50px; */
	/* margin-left: 250px; */
}
/* 마이페이지*/
.btn {
	padding: 15px;
	cursor: pointer;
	margin: 20px;
	width: 80px;
}

.flex-container {
	display: flex;
	padding: 20px;
}

.hidden {
	display: none;
}

table {
	width: 125%;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f4f4f4;
}

#longLoc {
	width: 250px;
}
</style>

</head>
<body>

	<%@include file="/WEB-INF/views/include/cheader.jsp"%>

	<!-- 사이드 바 -->
	<div class="container d-flex">
		<div class="list-group mx-2">
			<a href="/Company/CInfo?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item   shadow" style="width: 150px;">회사정보</a> <a
				href="/Company/PostForm?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item hs_list_effect shadow">공고관리 관리</a> <a
				href="/Company/SupportedList?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item shadow">받은 이력서 관리</a> <a href="#"
				class="list-group-item shadow">스크랩</a>
		</div>

		<!-- 페이지 내용 -->
		<div class=" mx-2 pb-4 w-100">
			<div class=" border border-tertiary p-5 rounded shadow">
				<div class="col-sm-9 page">
					<div class="d-flex justify-content-center">

						<form>
							<div class="tab-content">
								<h4>저희 회사에 지원한 이력서 목록입니다</h4>

								<table>
									<thead>
										<tr>
											<th>No</th>
											<th>id</th>
											<th id="longLoc">공고제목</th>
											<th id="longLoc">이력서제목</th>
											<th>유저아이디</th>

											<th>지원일자</th>

											<th>결과</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${applyedList}" varStatus="loop">
											<tr>
												<td>${loop.index + 1}</td>
												<!-- 이력서 번호 -->
												<td>${item.po_num }</td>
												<td><a
													href="/Company/PostView?po_num=${ item.po_num }&com_id=${ sessionScope.clogin.com_id }">${item.po_title }</a></td>
												<td><a
													href="/Users/ResumeView?re_num=${item.re_num}&user_id=${item.user_id}&com_id=${ sessionScope.clogin.com_id }">${item.re_title }</a></td>
												<td>${item.user_id }</td>
												<td>${item.ap_date }</td>

												<td>
													<div id="resultBtn_${loop.index + 1}"></div>
													<input type="hidden" id="user_id_${loop.index + 1}" name="user_id" value="${item.user_id}" />
													<input type="hidden" id="re_num_${loop.index + 1}" name="re_num" value="${item.re_num}" />
													<input type="hidden" id="result_${loop.index + 1}" name="result" value="${item.result}" />
													<input type="hidden" id="com_id_${loop.index + 1}" name="com_id" value="${ sessionScope.clogin.com_id }" />
													<input type="hidden" id="po_num_${loop.index + 1}" name="po_num" value="${item.po_num}" />
												</td>
											</tr>
											<script>
										        
											$(document).ready(function() {
												// 페이지 로딩
											});
											
											function checkstatus_${loop.index + 1}(user_id, re_num, result, com_id, po_num) {
									            // 각 반복 요소에 대한 결과 버튼 생성
									            let resultBtnEl = document.querySelector('#resultBtn_${loop.index + 1}');
									            //console.log(resultBtnEl);
									            $.ajax({
									                type: 'GET',
									                url: '/Company/checkstatus',
									                data: {
									                    user_id: user_id,
									                    re_num: re_num,
									                    result: result,
									                    com_id: com_id,
									                    po_num: po_num
									                },
									                success: function(data) {
									                    //console.log(result);
									                    if (result == 0) {
									                        resultBtnEl.innerHTML = '<button type="button" data-id="0" class="btn btn-secondary pass">대기</button>'
									                    } else if (result == 1) {
									                        resultBtnEl.innerHTML = '<button type="button" data-id="1" class="btn btn-danger pass">불합격</button>'
									                    } else {
									                        resultBtnEl.innerHTML = '<button type="button" data-id="2" class="btn btn-info pass">합격</button>'
									                    }
									                },
									                error: function(xhr, status, error) {
									                    // 데이터 요청이 실패했을 때 처리할 내용
									                    console.error(error);
									                }
									            });
									        };
												
									        let user_id_${loop.index + 1} = $('#user_id_${loop.index + 1}').val();
									        let re_num_${loop.index + 1} = $('#re_num_${loop.index + 1}').val();
									        let result_${loop.index + 1} = $('#result_${loop.index + 1}').val();
									        let com_id_${loop.index + 1} = $('#com_id_${loop.index + 1}').val();
									        let po_num_${loop.index + 1} = $('#po_num_${loop.index + 1}').val();
									        checkstatus_${loop.index + 1}(user_id_${loop.index + 1}, re_num_${loop.index + 1}, result_${loop.index + 1}, com_id_${loop.index + 1}, po_num_${loop.index + 1});
												
									        
									        // 대기, 불합격, 합격 버튼 생성을 위한 함수
									        function createSelectionButtons(idPrefix) {
									            return `
									                <button type="button" data-id="0" class="btn btn-secondary selection-btn">대기</button>
									                <button type="button" data-id="1" class="btn btn-danger selection-btn">불합격</button>
									                <button type="button" data-id="2" class="btn btn-info selection-btn">합격</button>
									            `;
									        }

									        $(document).ready(function() {
									            $(document).on('click', '.pass', function() {
									                // 현재 버튼의 위치를 기반으로 새로운 버튼들 추가
									                let currentBtn = $(this);
									                let idPrefix = currentBtn.closest('div').attr('id').match(/\d+/)[0]; // 현재 버튼의 id에서 숫자만 추출

									                // 선택 버튼들 추가
									                $('#resultBtn_' + idPrefix).html(createSelectionButtons(idPrefix));

									                // 선택 버튼 클릭 이벤트 처리
									                $('.selection-btn').on('click', function() {
									                    let selectedId = $(this).data('id'); // 선택된 버튼의 data-id 값
									                    let resultBtnEl = $('#resultBtn_' + idPrefix);

									                    if (selectedId == 0) {
									                        resultBtnEl.html('<button type="button" data-id="0" class="btn btn-secondary pass">대기</button>');
									                    } else if (selectedId == 1) {
									                        resultBtnEl.html('<button type="button" data-id="1" class="btn btn-danger pass">불합격</button>');
									                    } else {
									                        resultBtnEl.html('<button type="button" data-id="2" class="btn btn-info pass">합격</button>');
									                    }

									                    // 선택한 결과를 서버로 전송하여 저장하는 로직 구현...
									                    // 예시: 
									                    // $.ajax({...});
									                });
									            });
									        });
									    


										        
										    </script>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</form>

					</div>
				</div>
			</div>
		</div>

		<script>
		</script>
</body>
</html>