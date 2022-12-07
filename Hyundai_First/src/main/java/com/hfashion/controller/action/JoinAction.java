package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.MemberDAO;
import com.hfashion.dto.MemberDTO;
/*
 * 남승현 작성
 */
public class JoinAction implements Action{
	/*
	 * 기능 : 사용자의 회원가입 기능 
	 * 입력 : 아이디, 비밀번호, 이메일, 이름, 휴대폰 번호 
	 * 출력 : Insert 성공 여부 (true, false) 반환 받은 뒤, 결과값에 따른 화면 전환  
	 * 기타 : 회원가입 성공 시 session에 사용자 id를 붙여, 회원가입 화면에서 바로 뜨도록 설정  
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "Hfashion?command=joinsuccess";
		MemberDAO memberDAO = MemberDAO.getInstance();
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		String email = request.getParameter("user_email");
		String name = request.getParameter("user_name");
		String phone = request.getParameter("user_phone");
		MemberDTO member = new MemberDTO(id,pw,name,email,phone);
		boolean result = memberDAO.signUp(member);
		if(!result) {
			url = "Hfashion?command=signup";
		}else {
			HttpSession session =  request.getSession();
			session.setAttribute("id", id);
		}
		response.sendRedirect(url);
		
	}

}
