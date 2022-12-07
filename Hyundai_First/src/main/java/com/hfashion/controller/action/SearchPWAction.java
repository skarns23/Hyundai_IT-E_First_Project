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
public class SearchPWAction implements Action{
	/*
	 * 기능 : 비밀번호 찾기 버튼 클릭 시 성공여부 및 사용자 비밀번호를 반환
	 * 입력 : 사용자의 아이디, 이름, 이메일
	 * 출력 : 해당 조건에 부합하는 사용자의 비밀번호 반환 및 비밀번호 찾기 성공여부  
	 * 기타 : Gson 라이브러리 사용하여 Json 형태로 변환 후 Ajax에 응답 반환
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		MemberDAO mDAO = MemberDAO.getInstance();
		String result = mDAO.searchPW(user_id, user_name, user_email);
		Gson gson = new Gson();
		String value = gson.toJson(result);
		PrintWriter out = response.getWriter();
		out.print(value);
		
				
	}

}
