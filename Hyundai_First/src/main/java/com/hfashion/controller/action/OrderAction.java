package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dto.CartOrderDTO;
import com.hfashion.dto.MemberDTO;
import com.hfashion.dto.OrderCreditDTO;
import com.hfashion.dto.OrderFormDTO;
import com.hfashion.service.OrderFormService;
import com.hfashion.service.OrderService;


/*
 * 작성자 함세강
 * */
public class OrderAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//주문 결제창을 보여주기 위한 과정
		if(request.getMethod().equals("GET")) {
			String url = "product/order.jsp";
			
			HttpSession session = request.getSession();
			
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("loginUser");
			
			OrderFormService orderFormService = OrderFormService.getInstance();
			
			OrderFormDTO orderFormDTO = orderFormService.getOrderForm(memberDTO); 
			
			request.setAttribute("orderInfo", orderFormDTO);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		
		
		//주문 결과를 DB에 업데이트하기 위한 과정
		if(request.getMethod().equals("POST")) {
			String url = "Hfashion?command=orderComplete";
			
			HttpSession session = request.getSession();
			
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("loginUser");
			
			String postCode = request.getParameter("postCode");
			String address = request.getParameter("address");

			String userId = memberDTO.getUser_id();
			
			OrderCreditDTO dto = new OrderCreditDTO(postCode,address,userId);
			
			OrderService orderService = OrderService.getInstance();
			
			orderService.orderProductServie(dto);
			//우편번호, 주소, ID를 담은 객체를 매개변수로 입력하여 주문 정보를 입력하는 서비스 메서드 호출
			
			
			response.sendRedirect(url);
			
		}

	}

}
