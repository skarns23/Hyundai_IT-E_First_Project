package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hfashion.dao.MemberDAO;
/*
 * 남승현 작성 
 */
public class ConfirmEmailAction implements Action{
	/*
	 * 기능 : 회원 가입 및 아이디 찾기 시 이메일을 확인하는 기능 
	 * 입력 : 입력받은 이메일 
	 * 출력 : 동일한 이메일을 갖고있는 행의 수 반환  
	 * 기타 : Gson 라이브러리 사용하여 Json 형태로 변환 후 Ajax에 응답 반환 
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDAO mDAO = MemberDAO.getInstance();
		String email = request.getParameter("email");
		int check_email = mDAO.confirmEmail(email);
		Gson gson = new Gson();
		String result = gson.toJson(check_email);
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}
	
}
