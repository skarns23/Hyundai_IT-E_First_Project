<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
	<!-- 남승현 작성  
			기능 : 아이디 찾기 성공 시 사용자의 아이디 및 가입날짜를 띄워줌
	 								-->
<div id="container">
        <!-- content-wrap -->
<section class="content-wrap">
    <h2 class="page-title">아이디찾기 결과</h2>
		
    <!-- idpw-wrap -->
    <div class="idpw-wrap">
        <ul class="txt-info-group">
            <li>
                <span class="txt-label">아이디</span>
                <span class="txt-value"><c:out value="${id}"></c:out>  </span>
            </li>
            <li>
                <span class="txt-label">가입일</span>
                <span class="txt-value"><c:out value="${join_date}"></c:out></span>
            </li>
        </ul>
        <div class="btn-box">
            <a href="${contextPath}/Hfashion?command=loginform" class="btn-type2-lg">로그인</a>
        </div>
        <div class="id-guide-box">
                
            </div>
        </div>
    <!-- //idpw-wrap -->
</section>
</div>
<%@ include file="../layout/footer.jsp"%>

