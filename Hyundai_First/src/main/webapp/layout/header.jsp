<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${contextPath}/css/ui.min.css" >
</head>
<body>
  <header id="header">
    <div class="header-inner">
      <div class="header-wrap">
        <h1 class="header-logo">
          <a href="${contextPath}/main.jsp">H FASHION MALL</a>
        </h1>
        <nav class="header-util">
          <!-- 로그인 전 -->
          <span>
            <a href="${contextPath}/user/login.jsp">로그인</a>
          </span>
          <span>
            <a href="${contextPath}/user/register.jsp">회원가입</a>
          </span>
          <!-- //로그인 전 -->
          <!-- 로그인 후 -->
          <!-- //로그인 후 -->
          <span>
            <a href="${contextPath}/user/mypage/mypage.jsp">마이페이지</a>
          </span>
          <span>
            <a href="${contextPath}/product/cart2.jsp">장바구니</a>
          </span>
        </nav>
      </div>
      <!-- gnb -->
      <nav id="gnb">
        <div class="header-wrap">
          <div class="gnb-menu">
          	<div class="gnb-category">
              <a href="${contextPath}/product/productBestList.jsp">
                <span>베스트</span>
              </a>
            </div>
            <div class="gnb-category">
              <a href="${contextPath}/product/productTopList.jsp">
                <span>상의</span>
              </a>
            </div>
            <div class="gnb-category">
              <a href="#">
                <span>하의</span>
              </a>
            </div>
            <div class="gnb-category">
              <a href="#">
                <span>아우터</span>
              </a>
            </div>
            <div class="gnb-category">
              <a href="#">
                <span>ACC</span>
              </a>
            </div>
            <div class="gnb-category">
              <a href="${contextPath}/review/reviewList.jsp">
                <span>리뷰플러스</span>
              </a>
            </div>
          </div>
        </div>

      </nav>
    </div>

  </header>