package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.MemberDAO;
import com.hfashion.vo.MemberVO;
/*
 * 남승현 작성
 */
public class LoginAction implements Action {
	/*
	 * 기능 : 로그인화면에서 로그인 버튼 클릭 시 성공 여부를 판단하는 기능 
	 * 입력 : 사용자 아이디, 사용자 비밀번호 
	 * 출력 : 해당 사용자의 정보가 담긴 인스턴스 반환 
	 * 기타 : 인가처리를 통해 넘어온 경우 session의 redirectURL이 존재하여 기존에 클릭했던 페이지(마이페이지, 장바구니) 로 정상 이동
	 *        로그인 성공 시 Session에 loginUser 속성을 통해 사용자 인스턴스를 달아주어 사용자 정보 활용
	 *        회원가입 후 바로 로그인한 경우 session에 id속성이 있으므로 삭제시킴 
	 *        마이페이지 혹은 장바구니에 로그인하지 않은채로 접속을 시도했던 경우 다시 해당 위치로 이동시키도록
	 *        redirectURL을 찾아본 뒤  command의 value로 설정
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "user/login_fail.jsp";
		HttpSession session = request.getSession();
		MemberDAO memberDAO = MemberDAO.getInstance();
		String id = request.getParameter("login_id");
		String pw = request.getParameter("login_pw");
		MemberVO member = memberDAO.loginMember(id, pw);
		String redirectURL = (String) session.getAttribute("redirectURL");
		if (member != null) {
			url = "Hfashion";
			session.removeAttribute("id");
			session.setAttribute("loginUser", member);
		}
		if (redirectURL != null) {

			url = "Hfashion?command=" + redirectURL;
			session.removeAttribute("redirectURL");
		}

		response.sendRedirect(url);

	}

}
