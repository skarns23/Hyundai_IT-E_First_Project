package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

/*
 * 함세강 작성
 */
public class OrderCreditDAO {
	private OrderCreditDAO () {};
	private static OrderCreditDAO instance=null;
	public static OrderCreditDAO getInstance() {
		if(instance==null) {
			instance= new OrderCreditDAO();
		}
		return instance;
	}
	
	public void orderProduct(Connection con, String postCode, String address, String userId) {
		String runProcedure = "{call order_package.order_porcess(?,?,?)}"; 
		try {
			CallableStatement cstmt = con.prepareCall(runProcedure);
			
			cstmt.setString(1, postCode);
			cstmt.setString(2, address);
			cstmt.setString(3, userId);
			
			cstmt.execute();
			System.out.println("결제 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		
	}
}
