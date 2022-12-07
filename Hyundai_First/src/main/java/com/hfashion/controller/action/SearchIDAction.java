package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.MemberDAO;
import com.hfashion.vo.MemberVO;
/*
 * 남승현 작성 
 */
public class SearchIDAction implements Action{
	/*
	 * 기능 : 아이디 찾기 버튼 클릭시 아이디와 가입날짜를 찾아 반환하는 기능 
	 * 입력 : 찾는 사용자의 이름, 이메일, 휴대폰 번호
	 * 출력 : 주어진 이름, 이메일, 휴대폰 번호가 동일한 사용자의 아이디 및 가입날짜 
	 * 기타 : 찾은 사용자에대한 유효성 검사 및 아이디 유효성 여부 판단
	 *        request에 사용자 아이디, 가입날짜 속성을 부여하여 반환 
	 *        session에는 사용자 이이디를 붙여 로그인 화면으로 전환 시 아이디가 바로 설정되도록 구현
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/user/viewID.jsp";
		String name = request.getParameter("find_name");
		String email = request.getParameter("find_email");
		String phone = request.getParameter("find_phone");
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberVO member = memberDAO.findID(name, email, phone);
		if(member!=null&&member.getUser_id().length()!=0) {
			request.setAttribute("id", member.getUser_id());
			HttpSession session = request.getSession();
			session.setAttribute("id", member.getUser_id());
			request.setAttribute("join_date", member.getJoin_date());
		}else {
			url = "Hfashion?command=searchIdForm";
			response.sendRedirect(url);
			return;
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
		requestDispatcher.forward(request, response);
		
		
	}

}
