package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hfashion.dao.MemberDAO;
import com.hfashion.dto.MemberDTO;
/*
 * 남승현 작성
 */
public class UpdatePWAction implements Action{
	/*
	 * 기능 : 비밀번호 변경 기능 (새 비밀번호와 확인할 비밀번호 대조)
	 * 입력 : 사용자의 id, 새 비밀번호, 확인할 비밀번호 
	 * 출력 : 비밀번호 업데이트로 영향받은 행의 수 반환
	 * 기타 : Gson 라이브러리 사용하여 Json 형태로 변환 후 Ajax에 응답 반환
	 *        성공 시 기존 session에 존재하던 회원 인스턴스를 제거하고, 비밀번호가 변경된 인스턴스로 변경 
	 */
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "Hfashion";
      String update_pw = request.getParameter("user_pw");
      String check_pw = request.getParameter("user_pw_ck");
      
      MemberDAO instance = MemberDAO.getInstance();
      int result = 0;
      if(update_pw.equals(check_pw)){
         MemberDTO mVO = (MemberDTO)request.getSession().getAttribute("loginUser");
         result = instance.updatePW(mVO.getUser_id(), update_pw);
         if(result==1) {
            mVO.setUser_pw(update_pw);
            request.getSession().setAttribute("loginUser", mVO);
         }
      }
      Gson gson = new Gson();
      url =  result ==0 ?"Hfashion?command=mypage_updateForm":url;
      response.sendRedirect(url);
   }

}