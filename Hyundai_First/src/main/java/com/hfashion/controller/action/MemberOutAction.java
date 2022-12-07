package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hfashion.dao.MemberDAO;
import com.hfashion.vo.MemberVO;
/*
 * 남승현 작성 
 */
public class MemberOutAction implements Action{
	/*
	 * 기능 : 회원탈퇴 기능 
	 * 입력 : 사용자 아이디 
	 * 출력 : 사용자 회원탈퇴 날짜 업데이트 후 영향받은 행의 수 반환
	 * 기타 : 세션내의 유저 정보를 받아온 뒤, 회원탈퇴 메서드 수행 
	 *        세션 초기화를 통한 세션내 유저정보 삭제 
	 *         Gson 라이브러리 사용하여 Json 형태로 변환 후 Ajax에 응답 반환
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDAO mVO = MemberDAO.getInstance();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("loginUser");
		int result = mVO.secessionMember(memberVO.getUser_id());
		if(result == 1) {
			request.getSession().invalidate();
		}
		Gson gson = new Gson();
		String value = gson.toJson(result);
		PrintWriter out = response.getWriter();
		out.print(value);
	}

}
