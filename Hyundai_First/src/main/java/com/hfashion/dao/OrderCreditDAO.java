package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import com.hfashion.util.JdbcUtil;

/*
 * 함세강 작성
 */
public class OrderCreditDAO {
	//싱글톤 작성
	private OrderCreditDAO () {};
	private static OrderCreditDAO instance=null;
	public static OrderCreditDAO getInstance() {
		if(instance==null) {
			instance= new OrderCreditDAO();
		}
		return instance;
	}
	
	//주문하는 프로시저를 호출하는 DAO메서드 이다.
	public void orderProduct(Connection con, String postCode, String address, String userId) {
		String runProcedure = "{call order_package.order_porcess(?,?,?)}"; 
		try {
			CallableStatement cstmt = con.prepareCall(runProcedure);
			
			cstmt.setString(1, postCode);
			cstmt.setString(2, address);
			cstmt.setString(3, userId);
			
			cstmt.execute();
			
			JdbcUtil.close(cstmt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
