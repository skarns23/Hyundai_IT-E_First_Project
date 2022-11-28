package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.hfashion.dao.CartDAO;
import com.hfashion.vo.CartVO;
import com.hfashion.vo.MemberVO;

public class CartListAllAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    CartDAO cartDAO = CartDAO.getInstance();
	    
	    HttpSession session = request.getSession();
	    MemberVO member = (MemberVO) session.getAttribute("loginUser");
	    String user_id = member.getUser_id();
	    
		List<CartVO> cList = cartDAO.selectCart(user_id);
		
		Gson gson = new Gson();
	    String value = gson.toJson(cList);
	    PrintWriter out = response.getWriter();
	    out.print(value);
	    System.out.println("test 출력!!" + value.toString());
		
	}

}
