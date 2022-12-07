package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*
 * 남승현 작성
 */
public class LogoutAction implements Action {
	/*
	 * 기능 : 로그아웃 버튼 클릭 시 session 초기화 및 메인화면으로 전환 기능
	 * 입력 : 없음
	 * 출력 : 메인화면으로 전환   
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "Hfashion";
		HttpSession session = request.getSession(false);
		if(session!=null) {
			session.invalidate();
		}
		response.sendRedirect(url);
	}

}
