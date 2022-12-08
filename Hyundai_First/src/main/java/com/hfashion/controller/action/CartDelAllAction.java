package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.CartDAO;
import com.hfashion.dto.MemberDTO;

/*
 * 신수진 작성
 * */
public class CartDelAllAction implements Action{

	/*
	 * 기능 : 사용자의 장바구니에 있는 전체 상품 목록 삭제
	 * 입력 : 사용자 아이디
	 * 기타 : Gson 라이브러리 사용하여 Json 형태로 변환 후 Ajax에 응답 반환 
	 * */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartDAO cartDAO = CartDAO.getInstance();
		
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String user_id = member.getUser_id();
		
		cartDAO.delAllCart(user_id);
	}
}

