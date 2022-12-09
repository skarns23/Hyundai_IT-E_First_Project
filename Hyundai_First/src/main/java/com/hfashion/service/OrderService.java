package com.hfashion.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.hfashion.dao.OrderCreditDAO;
import com.hfashion.dto.OrderCreditDTO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;

/*
 * 작성자 함세강
 */
public class OrderService {
	//싱글톤 선언
	private OrderService() {};
	private static OrderService instance=null;
	public static OrderService getInstance() {
		if(instance==null) {
			instance = new OrderService();
		}
		return instance;
	}
	
	//주문하는 서비스 메서드
	public void orderProductServie (OrderCreditDTO dto) {
		Connection con = null;
		OrderCreditDAO dao = null;
		try {
			con = ConnectionProvider.getConnection();
			
			String postCode = dto.getPostCode();
			String address = dto.getAddress();
			String userId = dto.getUserID();
			
			dao = OrderCreditDAO.getInstance();
			dao.orderProduct(con,postCode, address, userId);
			//우편번호, 주소, ID를 입력받아서 DB에 데이터를 저장하는 dao메서드 호출
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		
		
	}
	
	
	
}
