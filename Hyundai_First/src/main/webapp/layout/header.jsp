<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>H Fashion Mall</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/ui.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="${contextPath}/js/ui.js"></script>
<script type="text/javascript" src="${contextPath}/js/product/product.js"></script>
<script type="text/javascript" src="${contextPath}/js/product/productCommon.js"></script>
</head>
<body>
	<header id="header">
		<div class="header-inner">
			<div class="header-wrap">
				<h1 class="header-logo">
					<a href="${contextPath}/Hfashion">H FASHION MALL</a>
				</h1>
				<nav class="header-util">
					<span> <c:choose>
							<c:when test="${empty sessionScope.loginUser}">
								<a href="${contextPath}/Hfashion?command=loginform">로그인</a></span> <span>
						<a href="${contextPath}/Hfashion?command=signup">회원가입</a> </c:when> <c:otherwise>
							<a href="${contextPath}/Hfashion?command=logout">로그아웃</a>
						</c:otherwise> </c:choose>
					</span> <span> <a href="${contextPath}/Hfashion?command=mypage">마이페이지</a>
					</span> <span> <a href="${contextPath}/Hfashion?command=cart">장바구니</a>
					</span>
				</nav>
			</div>
			<!-- gnb -->
			<nav id="gnb">
				<div class="header-wrap">
					<div class="gnb-menu">
						<div class="gnb-category">
							<a href="${contextPath}/product/productBestList.jsp"> <span>베스트</span>
							</a>
						</div>
						<div class="gnb-category">
							<a href="${contextPath}/Hfashion?command=productList&category=1"> <span>상의</span>
							</a>
						</div>
						<div class="gnb-category">
							<a href="${contextPath}/Hfashion?command=productList&category=2"> <span>하의</span>
							</a>
						</div>
						<div class="gnb-category">
							<a href="${contextPath}/Hfashion?command=productList&category=3"> <span>아우터</span>
							</a>
						</div>
						<div class="gnb-category">
							<a href="${contextPath}/Hfashion?command=productList&category=4"> <span>ACC</span>
							</a>
						</div>
						<div class="gnb-category">
							<a href="${contextPath}/Hfashion?command=reviewlist">  <span>리뷰플러스</span>
							</a>
						</div>
					</div>
				</div>

			</nav>
		</div>

	</header>