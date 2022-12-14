package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hfashion.dto.CartOrderDTO;
import com.hfashion.dto.OrderFormDTO;
import com.hfashion.util.JdbcUtil;

import oracle.jdbc.OracleTypes;

/*
 * 작성자 함세강
 * */
public class OrderFormDAO {
	
	//싱글톤 선언
	private OrderFormDAO() {}
	private static OrderFormDAO instance=null;
	public static OrderFormDAO getInstance() {
		if(instance==null) {
			instance = new OrderFormDAO();
		}
		return instance;
	}
	
	//결제 페이지 주문 리스트 불러오는 메서드
	public List<CartOrderDTO> getSelectedCart(Connection con, String loginId){
		List<CartOrderDTO> list = new ArrayList<CartOrderDTO>();

		String runProcedure = "{call order_form_package.order_list(?,?)}";
		//장바구니에서 선택된 아이템들의 데이터를 불러오는 프로시저 호출
	
		try {
			CallableStatement cstmt = con.prepareCall(runProcedure);
			cstmt.setString(1, loginId);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			
			while(rs.next()) {		
				 int cartAmount = rs.getInt(1);
				 String proSize = rs.getString(2);
				 String proName = rs.getString(3);
				 String proImage = rs.getString(5);
				 int price = rs.getInt(6);
				 String brandName = rs.getString(7);
				 
				 CartOrderDTO dto = new CartOrderDTO();
				 
				 dto.setCartAmount(cartAmount);
				 dto.setProSize(proSize);
				 dto.setProName(proName);
				 dto.setProImage(proImage);
				 dto.setProPrice(price);
				 dto.setBrandName(brandName);
				
				 list.add(dto);
			}
			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	//주문한 회원정보의 데이터를 가져오는 메서드
	public OrderFormDTO getOrderMember(Connection con, String loginId) {
		OrderFormDTO dto = new OrderFormDTO();
		
		String runProcedure = "{call order_form_package.order_member(?,?,?,?)}";
		//주문자의 정보를 가져오는 프로시저 호출
		
		try {
			CallableStatement cstmt = con.prepareCall(runProcedure);
			cstmt.setString(1, loginId);
			cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
			
			cstmt.execute();
			
			String userName = cstmt.getString(2);
			String userEmail = cstmt.getString(3);
			String userPhone = cstmt.getString(4);
			
			dto.setUserName(userName);
			dto.setUserEmail(userEmail);
			dto.setUserPhone(userPhone);
			
			JdbcUtil.close(cstmt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	
	
	
}
