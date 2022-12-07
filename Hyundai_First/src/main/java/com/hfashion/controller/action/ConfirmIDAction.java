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
public class ConfirmIDAction implements Action {
	/*
	 * 기능 : 사용자가 입력한 아이디의 사용가능 유뮤를 판단 
	 * 입력 : 사용자가 입력한 아이디
	 * 출력 : 입력받은 아이디와 동일한 아이디를 갖고 있는 행의 수 반환  
	 * 기타 : Gson 라이브러리 사용하여 Json 형태로 변환 후 Ajax에 응답 반환 
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("user_id");
		MemberDAO memberDAO = MemberDAO.getInstance();

		int result = memberDAO.confirmID(userId) ? 0 : 1;
		if (userId == null || userId.length() < 6) {
			result = 1;
		}
		Gson gson = new Gson();
		String value = gson.toJson(result);
		PrintWriter out = response.getWriter();
		out.print(value);
	}

}
