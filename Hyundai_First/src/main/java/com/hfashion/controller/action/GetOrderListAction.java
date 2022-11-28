package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.hfashion.dao.OrderDAO;
import com.hfashion.vo.OrderVO;

public class GetOrderListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		OrderDAO orderDAO = OrderDAO.getInstance();
		String start_date = request.getParameter("start_date").replace('-', '/').substring(2);
		String end_date = request.getParameter("end_date").replace('-', '/').substring(2);
		String user_id = request.getParameter("user_id");
		List<OrderVO> orderList = orderDAO.getOrderList(user_id, start_date, end_date);
		System.out.println("GetOderListAction");
		System.out.println(start_date);
		System.out.println(end_date);
		for(OrderVO oVO : orderList) {
			System.out.println(oVO);
		}
		Gson gson = new Gson();
		String value = gson.toJson(orderList);
		PrintWriter out = response.getWriter();
		out.print(value);
		System.out.println(value);
        
		
	}
	
}
