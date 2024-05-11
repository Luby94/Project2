<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Jick Job</title>
<meta charset="utf-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body>
	<header>
		<input type="hidden" id="current" val="siteMain" />
		<nav
			class="sj_full_container navbar navbar-light sticky-top border-bottom align-self-center py-4 navcolor">
			<div class="container d-flex justify-content-between">
				<div>
					<a class="navbar-brand fs-2" href="/"> <img src="/img/Rogo.png"
						width="60px;" height="50px;" class="d-inline-block align-text-top">
					</a>
				</div>
				<div>
					<ul class="nav link-dark"
						style="position: relative; bottom: -25px; left: -60px;">
						<c:choose>
							<c:when test="${ sessionScope.plogin == null || plogin == '' }">
								<li class="nav-item" id="main"><a
									class="nav-link link-dark" aria-current="page"
									href="/Login">채용정보</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item" id="main"><a
									class="nav-link link-dark" aria-current="page"
									href="/Post/List?user_id=${ sessionScope.plogin.user_id}">채용정보</a></li>
							</c:otherwise>
						</c:choose>
						<li class="nav-item" id="Jicjob"><a
							class=" nav-link link-dark" href="#">인재정보</a></li>
						<li class="nav-item" id="Jicjob"><a
							class=" nav-link link-dark"
							href="/Community/ComuHome?user_id=${ sessionScope.plogin.user_id}">커뮤니티</a></li>
						<li class="nav-item" id="Jicjob"><a
							class=" nav-link link-dark" href=#">고객센터</a></li>


						<c:choose>
							<c:when test="${ sessionScope.plogin == null || plogin == '' }">
								<li class="nav-item"><a class="nav-link link-dark"
									href="/LoginForm">로그인</a></li>
							</c:when>
							<c:otherwise>
								<li>${ plogin.user_id }님 환영합니다</li>
								<li><a href="/Logout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>

				</div>
				<div>
					<c:choose>
						<c:when test="${ sessionScope.plogin == null || plogin == '' }">
						</c:when>
						<c:otherwise>
							<a class="nav-link"
								href="/Users/Info?user_id=${ sessionScope.plogin.user_id }">
								<img src="/img/mypage_logo.png" style="width: 40px;">
							</a>
						</c:otherwise>
					</c:choose>
				</div>

			</div>

		</nav>
	</header>