<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ include file="../layout/header.jsp"%>
<%
	String name = (String)session.getAttribute("id");
	name = name==null?"":name;
%>
	<!-- 남승현 작성  
			기능 : 로그인 시 session에 id 값이 들어있는 경우 먼저 띄워줌 없는 경우 띄워주지 않도록 공백 설정 
	 -->
<div id="container">
	<javascript>
		
	</javascript>
	<section class="content-wrap">
		<h2 class="page-title">로그인</h2>
		
		<!-- login-wrap -->

		<div class="login-wrap"
			style="display: flex; justify-content: center;">
			<div id="loginTab" class="login-tab tab-wrap2 ui-tab initialized">
				<ul class="tabs tab-btn"
					style="margin: 1em auto; justify-content: center;">
					<li class="on"><a href="javascript:;">H패션몰 회원</a></li>
				</ul>

				<!-- 탭1 H.Point 통합회원 -->
				<div class="tab-cont on">
					<div class="login-group hpoint"
						style="justify-content: center; margin: 0 100px;">
						<div class="login-left tab-wrap3 ui-tab initialized">
							<ul class="tabs tab-btn">
								
							</ul>
							<form method="post" action="${contextPath}/Hfashion?command=login">
							<!-- 탭1-1 -->
							<div class="tab-cont on">
								<ul class="login-input">
									<li>
										<div class="input-box">
											<input type="text" title="H.Point 아이디"
												placeholder="H.Point 아이디" class="inp-reset"
												id="userIdHpoint" name="login_id" value=<%=name %>>
											<div class="etc">
												<button type="button" class="btn-clear">
													<span>지우기</span>
												</button>
											</div>
										</div>
										<p class="txt-invalid" id="descUserIdHpoint"></p>
									</li>
									<li>
										<div class="input-box">
											<input type="password" title="H.Point 비밀번호"
												placeholder="H.Point 비밀번호" class="inp-reset"
												id="passwordHpoint" name="login_pw">
											<div class="etc">
												<button type="button" class="btn-masking">
													<span>마스킹</span>
												</button>
												<button type="button" class="btn-clear"
													style="display: inline-block;">
													<span>지우기</span>
												</button>
											</div>
										</div>
										<p class="txt-invalid" id="descPasswordHpoint"></p>
									</li>
								</ul>

								<div class="login-link">
									<div class="login-check">
										<label class="check-skin"> <input type="checkbox"
											id="chkSaveIdHpoint" name="saveIdHpoint" checked="">
											<span>아이디 저장</span>
										</label>
									</div>
									<ul class="links">
										<li><a href="${contextPath}/Hfashion?command=searchIdForm" title="새창으로 열림"
											>아이디 찾기</a></li>
										<li><a href="${contextPath}/Hfashion?command=searchPwForm" title="새창으로 열림"
											>비밀번호 찾기</a></li>
									</ul>
								</div>

								<div class="btn-box">
									<button type="submit" class="btn-type2-xlg"
										>
										<span>로그인</span>
									</button>
								</div>
							</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script>
			</script>
		</div>
		<!-- //login-wrap -->
	</section>

</div>
<%@ include file="../layout/footer.jsp"%>
