<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>
<div id="container">
	<section class="content-wrap">
		<div class="snb-wrap">
			<h2 class="lnb-title">
				<a href="${contextPath}/user/mypage/mypage.jsp">MYPAGE</a>
			</h2>
			<nav id="lnb" class="lnb">
				<ul>
					<li>
						<div class="menu-depth1">쇼핑정보</div>
						<ul class="menu-depth2">
							<li><a href="${contextPath}/user/mypage/listOrder.jsp">주문</a></li>
							<li><a href="${contextPath}/user/mypage/listClaimOrder.jsp">주문취소</a></li>

						</ul>
					</li>
					<li>
						<div class="menu-depth1">회원정보</div>
						<ul class="menu-depth2">
							<li><a href="${contextPath}/user/mypage/pwdConfirm.jsp">회원정보 수정</a></li>
							<li><a href="${contextPath}/user/mypage/memberSecession.jsp">회원 탈퇴</a></li>
						</ul>
					</li>

				</ul>
			</nav>
		</div>
		<!-- snb-content-wrap -->
		<div class="snb-content-wrap">
			<h3 class="page-title">회원정보 수정</h3>

			<div class="page-info">
				<p class="txt-type3">
					회원님의 소중한 개인정보 보호를 위해<br> 비밀번호를 다시 한번 입력해주시기 바랍니다.
				</p>
			</div>

			<div class="tbl-write">
				<form method="post" action="/secured/mypage/updateMember"
					id="checkPwdForm">
					<input type="hidden" name="_csrf"
						value="f38905a6-11d9-48ad-a9b6-282f7e502314">
					<table>
						<caption>비밀번호 확인</caption>
						<colgroup>
							<col style="width: 190px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">비밀번호</th>
								<td>
									<div class="input-box">
										<input type="password" title="비밀번호" name="mbr.mbrPw"
											id="mbrPw" maxlength="15" autocomplete="off"
											placeholder="비밀번호를 입력해주세요." class="inp-reset">
										<div class="etc">
											<button type="button" class="btn-clear">
												<span>지우기</span>
											</button>
										</div>
									</div> <!-- 유효성 검사 메시지 출력 -->
									<p class="txt-invalid" id="descMbrPw" style="display: block;"></p>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>

			<div class="btn-box">
				<button type="button" class="btn-type2-lg"
					onclick="javascript:checkPwd();return false;">
					<span>확인</span>
				</button>
			</div>

		</div>
		<!-- //snb-content-wrap -->
	</section>
</div>
<%@ include file="/layout/footer.jsp" %>