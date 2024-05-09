<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jik Job</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<style>
  body {
    font-family: 'Noto Sans KR', sans-serif; /* 여기에 폰트를 적용합니다 */
    margin: 0; /* 바디의 마진을 제거하여 전체적인 여유분 조정 시작점을 일관되게 합니다. */
    padding: 80px; /* 바디 전체에 여유분 추가 */
  }
  .header {
    display: flex;
    justify-content: space-between; /* 로고와 내비게이션, 마이페이지 로고를 양끝과 중앙으로 배치 */
    align-items: center;
    padding: 20px; /* 헤더 내부 여유분 추가 */
    background-color: #FFFFFF;
  }
  .navbar-container {
    display: flex;
    justify-content: center; /* 내비게이션 항목들을 중앙으로 정렬 */
    flex-grow: 1; /* 로고 옆의 공간을 모두 차지하도록 설정 */
  }
  .navbar {
    display: flex;
    list-style: none;
    padding: 0;
    margin: 0;
    justify-content: center; /* 내비게이션 항목들을 중앙으로 정렬 */
  }
  .navbar li {
    padding: 10px 20px;
  }
  .navbar a {
    text-decoration: none;
    color: black;
  }
  .mypage-logo {
    height: 50px; /* 마이페이지 로고의 높이 설정 */
  }
</style>
</head>
<body>

<header class="header">
  <div class="site-mark">
    <img src="/img/Rogo.png" alt="사이트 로고" style="height: 50px;"> <!-- 로고 이미지 -->
  </div>
  <div class="navbar-container">
    <nav>
      <ul class="navbar">
        <li><a href="#">채용정보</a></li>
        <li><a href="#">인재정보</a></li>
        <li><a href="#">고객센터</a></li>
        <li><a href="#">커뮤니티</a></li>
      </ul>
    </nav>
  </div>

  <!-- 마이페이지 로고 추가 -->
  <div class="site-mark">
  	<a href="/Users/Info?user_id=${ sessionScope.login.user_id}class="mypage-logo">
  		<img src="mypage_logo.png" alt="마이페이지 로고">
    </a>
</div>
</header>

</body>
</html>