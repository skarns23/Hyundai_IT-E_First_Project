<!-- 신수진 작성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer id="footer">
	<div class="footer-inner">
		<p class="footer-logo">현대백화점 그룹 공식 패션몰</p>
		<nav class="footer-link">
			<div class="box">
				<p class="tit">ABOUT</p>
				<ul class="list">
					<li><a href="https://www.handsome.co.kr/ko/main.do">회사소개</a></li>
					<li><a href="https://www.hfashionmall.com/public/cspage/shopInfo">매장안내</a></li>
					<li><a href="https://www.hfashionmall.com/public/cspage/home">고객센터</a></li>
					<li>
						<button type="button" onclick="termsShow('H패션몰 서비스 이용약관', '/public/cspage/terms?type=terms', '/public/cspage/terms?type=terms2', '/public/cspage/terms?type=terms3', '/public/cspage/terms?type=terms4','이용약관',null, 'POST');">이용약관</button>
					</li>
				</ul>
			</div>
			<div class="box">
				<p class="tit">HELP</p>
				<ul class="list">
					<li><a href="https://www.hfashionmall.com/public/member/membershipInfo/hfm">회원혜택</a></li>
					<li><a href="https://www.hfashionmall.com/public/member/membershipInfo/hs">한섬 VVIP 혜택</a></li>
					<li>
						<button type="button" onclick="privacyTerms();">
							<strong class="privacy">개인정보처리방침</strong>
						</button>
					</li>
					<li><a href="javascript:void(0);" onclick="layer.open('layerQnAselect');">고객의 소리</a></li>
				</ul>
			</div>
			<div class="sns">
				<ul>
					<li class="facebook">
						<a href="https://www.facebook.com/Hfashionmall" target="_blank">Facebook</a>
					</li>
					<li class="post">
						<a href="https://blog.naver.com/h_edit" target="_blank">Post</a>
					</li>
					<li class="insta">
						<a href="https://www.instagram.com/hfashionmall_official" target="_blank">Instagram</a>
					</li>
				</ul>
			</div>
		</nav>
		<div class="footer-info">
			<p>
				(주)한섬<br>서울특별시 강남구 도산대로 523(청담동)<br>대표이사 : 김민덕<br>사업자등록번호
				: 120-81-26337<br>통신판매업신고 : 제 2009-서울강남-00826 호<br>개인정보보호책임자
				: 윤인수<br>호스팅서비스 : (주)한섬 
				<a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1208126337" target="_blank">사업자정보확인</a>
				<button type="button" onclick="openLayerPayInfo()">채무지급보증안내</button>
			</p>
			<p class="contact">
				<span>전화 1800-5700(유료)</span><span>팩스 02-476-8169</span>
				<span>이메일 <a href="mailto:hfashionmall@hyundaihmall.com">hfashionmall@hyundaihmall.com</a></span>
			</p>
		</div>
	</div>
</footer>

</body>
</html>