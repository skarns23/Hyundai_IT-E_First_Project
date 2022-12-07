package com.hfashion.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.hfashion.dao.OrderFormDAO;
import com.hfashion.dto.CartOrderDTO;
import com.hfashion.dto.MemberDTO;
import com.hfashion.dto.OrderFormDTO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;

/*
 * 작성자 함세강
 * */
public class OrderFormService {
	
	//싱글톤 선언
	private OrderFormService() {};
	private static OrderFormService instance=null;
	public static OrderFormService getInstance() {
		if(instance==null) {
			instance = new OrderFormService();
		}
		return instance;
	}
	
	//결제창에서 필요한 정보를 가져오는 서비스 메서드
	public OrderFormDTO getOrderForm(MemberDTO memberDTO) {
		OrderFormDTO dto = null;
		Connection con =null;
		List<CartOrderDTO> list = null;
		try {
			con = ConnectionProvider.getConnection();
			
			OrderFormDAO dao = OrderFormDAO.getInstance();
			
			String loginId = memberDTO.getUser_id();
						
			list = dao.getSelectedCart(con,loginId);
				
			dto = dao.getOrderMember(con,loginId);
			dto.setOrderList(list);
			
			int totalPrice = 0;
			int deliveryFee = 0;
			for (CartOrderDTO cartDTO : list) {
				totalPrice += cartDTO.getProPrice()*cartDTO.getCartAmount();
			}
			
			if(totalPrice<30000) {deliveryFee=2500; totalPrice+=deliveryFee;}
			
			dto.setTotalPrice(totalPrice);
			dto.setDeliveryFee(deliveryFee);
			
			return dto;

		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		
	}
	
	
}
