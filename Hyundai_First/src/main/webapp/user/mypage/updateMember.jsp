<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/layout/header.jsp"%>
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
                     <li><a href="${contextPath}/Hfashion?command=mypage_searchOrder">주문조회</a></li>
                     


                  </ul>
               </li>
               <li>
                  <div class="menu-depth1">회원정보</div>
                  <ul class="menu-depth2">
                     <li><a href="${contextPath}/Hfashion?command=mypage_pwConfirmpage">회원정보 수정</a></li>
                     <li><a href="${contextPath}/Hfashion?command=mypage_OutForm">회원 탈퇴</a></li>
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

            <form action="Hfashion?command=updatePW" method="post" id="updateForm">
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
                           <td id="mbrId">${sessionScope.loginUser.user_id}</td>
                        </tr>
                        <tr class="tr-txt">
                           <th scope="row">이름</th>
                           <td id="mbrNm">${sessionScope.loginUser.user_name}</td>
                        </tr>
                        <tr>
                           <th scope="row">새 비밀번호</th>
                           <td class="w-full">
                              <div class="input-box" id="divMbrPw">
                                 <input type="password" title="비밀번호" name="user_pw" id="mbrPw" minlength="8" maxlength="15" placeholder="" class="inp-reset" required>
                              </div>
                              <p class="txt-invalid" style="display: block;" id="descMbrPw"></p>
                              <p class="txt-form-cmt">영문, 숫자, 특수문자 조합 8-15자로 사용 가능</p>
                              <div class="input-box" id="divMbrCheckPw">
                                 <input type="password" title="비밀번호 확인" name="user_pw_ck" id="mbrCheckPw" maxlength="15" placeholder="비밀번호 확인" class="inp-reset" required>
                              </div>
                              <p class="txt-invalid" style="display: block;" id="descMbrCheckPw"></p>
                           </td>
                        </tr>
                        <tr>
                           <th scope="row">휴대폰번호</th>
                           <td class="w-full"><input type="hidden" name="mbr.mobilNo" value="" disabled=""> <span class="txt-tbl-phone" id="lbMobileNo">${sessionScope.loginUser.user_phone}</span></td>
                        </tr>
                        <tr>
                           <th scope="row">이메일</th>
                           <td>
                              <div class="email-box">
                                 <div class="input-box invalid">
                                    <input type="text" title="이메일" id="mbrEmail" placeholder="이메일을 입력해주세요." class="inp-reset" value="${sessionScope.loginUser.user_email}" disabled="">
                                    <div class="etc">
                                       <button type="button" class="btn-clear">
                                          <span>지우기</span>
                                       </button>
                                    </div>
                                 </div>
                              </div>
                              <p class="txt-invalid" style="display: block;" id="msgMbrEmail"></p>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
         </div>
         <!-- //write-wrap -->
         <div class="btn-box">
            <button type="submit" class="btn-type2-lg" id="btn_update" disabled="true" style="width: 250px;">
               <span>회원정보 수정</span>
            </button>
            </form>
         </div>
      </div>
      <!-- //snb-content-wrap -->
   </section>
   <script>
      $(function() {
         let btn_update = $("#btn_update");
         $("#mbrCheckPw").focusout(function() {
            var update_pw = $("#mbrPw").val();
            let check_pw = $("#mbrCheckPw").val();
            btn_update.attr('disabled', true);
            if (update_pw.length < 8) {
               $("#descMbrCheckPw").html("비밀번호 사용불가");
            } else if (update_pw === check_pw) {
               $("#descMbrCheckPw").html("비밀번호 일치");
               btn_update.attr('disabled', false);
            } else {
               $("#descMbrCheckPw").html("비밀번호가 일치하지 않습니다.");
            }

         });
      })
   </script>
</div>
<%@ include file="/layout/footer.jsp"%>