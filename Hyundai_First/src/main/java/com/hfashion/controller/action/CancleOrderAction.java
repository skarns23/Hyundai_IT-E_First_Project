package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hfashion.dao.OrderDAO;

/*
 *  남승현 작성 
 */
public class CancleOrderAction implements Action{
	/*
	 * 기능 : 주문취소 버튼 클릭 시 해당 상품의 주문취소 날짜 컬럼을 업데이트하여 없애고, 재고를 올리는 기능
	 * 입력 : 사용자의 id, 주문번호, 상품 번호, 상품 사이즈
	 * 출력 : 상품 취소로 인해 영향 받은 행의 수 반환 
	 * 기타 : Gson 라이브러리 사용하여 Json 형태로 변환 후 Ajax에 응답 반환 
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user_id = request.getParameter("user_id");
		String order_no = request.getParameter("order_no");
		String pro_no = request.getParameter("pro_no");
		String pro_size = request.getParameter("pro_size");
		OrderDAO oDAO = OrderDAO.getInstance();	
		int result = oDAO.cancleOrder(order_no, user_id, pro_no, pro_size);
		Gson gson = new Gson();
		String val = gson.toJson(result);
		PrintWriter out = response.getWriter();
		out.print(val);
		
	}
	
	

}
