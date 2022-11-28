package com.hfashion.dao;

/*
 * 작성자 함세강
 */
public class OrderDAO {
	//싱글톤 선언
	private OrderDAO() {}
	private static OrderDAO instance=null;
	public static OrderDAO getInstance() {
		if (instance==null) {
			instance = new OrderDAO();
		}
		return instance;
	}
	
	public void orderProduct(String postCode, String address, String userId) {
		
		
		
	}
	
	
	
}
