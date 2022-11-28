package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hfashion.util.JdbcUtil;
import com.hfashion.vo.CartDTO;
import com.hfashion.vo.OrderFormDTO;

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
	public List<CartDTO> getSelectedCart(Connection con, String loginId){
		List<CartDTO> list = new ArrayList<CartDTO>();
		
		
		String runProcedure = "{call orderForm_package.order_list(?,?)}";
		
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
				 
				 CartDTO dto = new CartDTO();
				 
				 dto.setCartAmount(cartAmount);
				 dto.setProSize(proSize);
				 dto.setProName(proName);
				 dto.setProImage(proImage);
				 dto.setProPrice(price);
				 dto.setBrandName(brandName);
				
				 list.add(dto);
				 System.out.println("check");
			}
			
			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}


	public OrderFormDTO getOrderMember(Connection con, String loginId) {
		OrderFormDTO dto = new OrderFormDTO();
		
		String runProcedure = "{call orderForm_package.order_member(?,?,?,?)}";
		
		try {
			CallableStatement cstmt = con.prepareCall(runProcedure);
			cstmt.setString(1, loginId);
			cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
			
			cstmt.executeQuery();
			
			String userName = cstmt.getString(2);
			String userEmail = cstmt.getString(3);
			String userPhone = cstmt.getString(4);
			
			dto.setUserName(userName);
			dto.setUserEmail(userEmail);
			dto.setUserPhone(userPhone);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return dto;
	}
	
	
	
	
	
}
