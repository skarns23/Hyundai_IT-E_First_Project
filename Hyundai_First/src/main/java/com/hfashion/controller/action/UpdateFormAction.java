package com.hfashion.controller.action;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.controller.action.Action;
/*
 * 남승현 작성
 */
public class UpdateFormAction implements Action{
	/*
	 * 기능 : 회원정보 수정 화면으로 포워딩 기능
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "user/mypage/updateMember.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
