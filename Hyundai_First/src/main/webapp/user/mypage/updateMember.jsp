<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp" %>
<div id="container">
	<section class="content-wrap">


		<div class="snb-wrap">
			<h2 class="lnb-title">
				<a href="${contextPath}/Hfashion?command=mypage">MYPAGE</a>
			</h2>
			<nav id="lnb" class="lnb">
				<ul>
					<li>
						<div class="menu-depth1">쇼핑정보</div>
						<ul class="menu-depth2">
							<li><a href="${contextPath}/Hfashion?command=mypage_searchOrder">주문</a></li>
							<li><a href="${contextPath}/user/mypage/listClaimOrder.jsp">주문취소</a></li>

						</ul>
					</li>
					<li>
						<div class="menu-depth1">회원정보</div>
						<ul class="menu-depth2">
							<li><a href="${contextPath}/user/mypage/pwdConfirm.jsp">회원정보
									수정</a></li>
							<li><a href="${contextPath}/user/mypage/memberSecession.jsp">회원
									탈퇴</a></li>
						</ul>
					</li>

				</ul>
			</nav>
		</div>
		<!-- snb-content-wrap -->
		<div class="snb-content-wrap">
			<h3 class="page-title">회원정보 수정</h3>
			<!-- write-wrap -->
			<div class="write-wrap">
				<h4 class="sec-title mt0">회원정보</h4>

				<form action="/secured/mypage/updateMemberAction" method="post"
					id="updateForm">
					<input type="hidden" name="refererUrlType" value=""> <input
						type="hidden" name="_csrf"
						value="6a5a0df1-e36a-4ec6-bb46-e061b1389d24"> <input
						type="hidden" id="pwdCheck"> <input type="hidden"
						id="snsCd" name="snsCd">
					<div class="tbl-write">

						<table>
							<caption>회원정보 수정</caption>
							<colgroup>
								<col style="width: 190px">
								<col>
							</colgroup>
							<tbody>
								<tr class="tr-txt">
									<th scope="row">아이디</th>
									<td id="mbrId">ska*****</td>
								</tr>
								<tr class="tr-txt">
									<th scope="row">이름</th>
									<td id="mbrNm">남*현</td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td class="w-full">
										<button type="button" class="btn-type1-m" id="showChangePw">
											<span>비밀번호 변경</span>
										</button>

										<div id="pwEditArea" class="toggle-box">
											<div class="edit-info-wrap">
												<div class="input-box" id="divMbrPw">
													<input type="password" id="mbrPw" title="새 비밀번호"
														placeholder="새 비밀번호" class="inp-reset" maxlength="15">
													<div class="etc">
														<!-- [D]비밀번호 안전도 : 안전 -->
														<span class="txt-pw-level" id="pwdHigh">안전</span>
														<!-- [D]비밀번호 안전도 : 보통 -->
														<span class="txt-pw-level" id="pwdNormal">보통</span>

														<button type="button" class="btn-masking" tabindex="-1">
															<span>마스킹</span>
														</button>
														<button type="button" class="btn-clear" tabindex="-1">
															<span>지우기</span>
														</button>
													</div>
												</div>
												<div class="input-box" id="divMbrCheckPw">
													<input type="password" id="mbrPwRe" title="새 비밀번호 확인"
														placeholder="새 비밀번호 확인" class="inp-reset" maxlength="15">
													<div class="etc">
														<!-- [D]비밀번호 안전도 : 안전-->
														<span class="txt-pw-level" id="checkPwdHigh">안전</span>
														<!-- [D]비밀번호 안전도 : 보통 -->
														<span class="txt-pw-level" id="checkPwdNormal">보통</span>

														<button type="button" class="btn-masking" tabindex="-1">
															<span>마스킹</span>
														</button>
														<button type="button" class="btn-clear" tabindex="-1">
															<span>지우기</span>
														</button>
													</div>
												</div>
												<p class="txt-invalid" style="display: block;"
													id="descMbrPw">
													<!--유효성 검사 메시지 출력-->
												</p>
												<p class="txt-form-cmt">영문, 숫자, 특수문자 3가지 종류 8-15자 또는 2종류
													이상 조합 10-15자로 사용 가능</p>

												<div class="btn-box align-left">
													<button type="button" class="btn-type4-m"
														onclick="javascript:document.querySelector('#pwEditArea').classList.remove('open');">
														<span>취소</span>
													</button>
													<button type="button" class="btn-type2-m"
														id="modifyPassword">
														<span>비밀번호 변경</span>
													</button>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">휴대폰번호</th>
									<td class="w-full"><input type="hidden" name="mbr.mobilNo"
										value="" disabled=""> <span class="txt-tbl-phone"
										id="lbMobileNo">010-****-3372</span></td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td>
										<div class="email-box">
											<div class="input-box invalid">
												<input type="text" title="이메일" id="mbrEmail"
													placeholder="이메일을 입력해주세요." class="inp-reset"
													value="ska*****@*****.***" disabled="">
												<div class="etc">
													<button type="button" class="btn-clear">
														<span>지우기</span>
													</button>
												</div>
											</div>
										</div>
										<p class="txt-invalid" style="display: block;"
											id="msgMbrEmail"></p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
			<!-- //write-wrap -->
			<div class="btn-box">
				<button type="button" class="btn-type2-lg" onclick="formSubmit();"
					style="width: 250px;">
					<span>회원정보 수정</span>
				</button>

			</div>
		</div>
		<!-- //snb-content-wrap -->
	</section>
</div>
<%@ include file="/layout/footer.jsp" %>