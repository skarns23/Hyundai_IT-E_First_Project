package com.hfashion.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.hfashion.dao.OrderFormDAO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;
import com.hfashion.vo.CartDTO;
import com.hfashion.vo.MemberVO;
import com.hfashion.vo.OrderFormDTO;

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
	
	
	public OrderFormDTO getOrderForm(MemberVO memberDTO) {
		OrderFormDTO dto = null;
		Connection con =null;
		List<CartDTO> list = null;
		try {
			con = ConnectionProvider.getConnection();
			
			OrderFormDAO dao = OrderFormDAO.getInstance();
			
			String loginId = memberDTO.getUser_id();
			
			System.out.println("서비스에서 loginId : "+loginId);
			
			list = dao.getSelectedCart(con,loginId);
			
			for (CartDTO cartDTO : list) {
				System.out.println("final check");
				System.out.println(cartDTO.getBrandName());
				System.out.println(cartDTO.getCartAmount());
				System.out.println(cartDTO.getProName());
				
			}
			
			dto = dao.getOrderMember(con,loginId);
			dto.setOrderList(list);
			
			int totalPrice = 0;
			for (CartDTO cartDTO : list) {
				totalPrice += cartDTO.getProPrice()*cartDTO.getCartAmount();
			}
			
			dto.setTotalPrice(totalPrice);
			
			
			return dto;

		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		
	}
	
	
}
