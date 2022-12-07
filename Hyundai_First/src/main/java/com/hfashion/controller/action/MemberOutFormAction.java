package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 남승현 작성
 */
public class MemberOutFormAction implements Action{
	/*
	 * 기능 : 회원탈퇴 화면으로 포워딩 기능 
	 * 입력 : 없음
	 * 출력 : 회원탈퇴 페이지로 전환   
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/user/mypage/memberSecession.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
