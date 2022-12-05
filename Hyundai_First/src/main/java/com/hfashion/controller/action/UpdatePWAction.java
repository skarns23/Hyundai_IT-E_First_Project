package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hfashion.dao.MemberDAO;
import com.hfashion.vo.MemberVO;
/*
 * 남승현 작성
 */
public class UpdatePWAction implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      String url = "Hfashion";
      String update_pw = request.getParameter("user_pw");
      String check_pw = request.getParameter("user_pw_ck");
      
      MemberDAO instance = MemberDAO.getInstance();
      System.out.println(update_pw);
      System.out.println(check_pw);
      int result = 0;
      if(update_pw.equals(check_pw)){
         MemberVO mVO = (MemberVO)request.getSession().getAttribute("loginUser");
         result = instance.updatePW(mVO.getUser_id(), update_pw);
         if(result==1) {
            mVO.setUser_pw(update_pw);
            request.getSession().setAttribute("loginUser", mVO);
         }
      }
      Gson gson = new Gson();
      url =  result ==0 ?"Hfashion?command=mypage_updateForm":url;
      /*
       * String value = gson.toJson(url); System.out.println("UpdatePWAction : "+url);
       * PrintWriter out = response.getWriter(); out.print(value);
       * System.out.println(value);
       */
      response.sendRedirect(url);
   }

}