package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hfashion.dao.OrderDAO;
import com.hfashion.dto.OrderDTO;

/*
 * 남승현 작성 
 */
public class GetOrderListAction implements Action{
	/*
	 * 기능 : 주어진 기간에 따라 주문내역을 조회하는 기능 
	 * 입력 : 검색 시작일, 검색 종료일, 사용자의 아이디 
	 * 출력 : 주어진 기간내에 해당 사용자의 주문 내역  
	 * 기타 : Gson 라이브러리 사용하여 Json 형태로 변환 후 Ajax에 응답 반환
	 * 		  검색 시작일과 검색 종료일의 format을 DB와 맞춰주기위해 변환  
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		
		String start_date = request.getParameter("start_date").replace('-', '/').substring(2);
		String end_date = request.getParameter("end_date").replace('-', '/').substring(2);
		String user_id = request.getParameter("user_id");
		List<OrderDTO> orderList = orderDAO.getOrderList(user_id, start_date, end_date);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String value = gson.toJson(orderList);
		PrintWriter out = response.getWriter();
		out.print(value);
		
	}
	
}
