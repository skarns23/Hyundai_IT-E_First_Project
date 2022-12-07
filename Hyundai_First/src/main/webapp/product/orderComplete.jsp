<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div id="container">
	<section class="content-wrap">
		<h2 class="page-title">주문완료</h2>
		<br>
		<br>
		<br>
		<br>
		<div class="order-header">
			<p class="txt"><c:out value="${loginUser.user_id}"></c:out> 님 주문이 정상적으로 완료되었습니다. (주문번호 : OD202211236994026)</p>
		</div>
		<br>
		<div class="btn-box">
			<a href="javascript:location.href='${contextPath}/main.jsp'" class="btn-type4-lg">쇼핑 계속하기</a> <a href="${contextPath}/Hfashion?command=mypage" id="btnOrderList" class="btn-type2-lg">주문내역조회</a>
		</div>
	</section>
</div>

<%@ include file="../layout/footer.jsp"%>