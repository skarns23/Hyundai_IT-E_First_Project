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
public class CartSelUpdateAction implements Action{

	/*
	 * 기능 : 사용자가 선택한 장바구니 상품 목록 선택 상태 변경
	 * 입력 : 상품 번호, 사이즈, 사용자 아이디
	 * 기타 : Gson 라이브러리 사용하여 Json 형태로 변환 후 Ajax에 응답 반환 
	 * */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		CartDAO cartDAO = CartDAO.getInstance();
		
		String pro_no = request.getParameter("pno");
		String size_name = request.getParameter("size");
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String user_id = member.getUser_id();
		
		cartDAO.selUpdateCart(pro_no, size_name, user_id);
	}
}

