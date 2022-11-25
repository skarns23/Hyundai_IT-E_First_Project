package com.hfashion.dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/*
 * 신수진 작성
 * */
public class ProductDAO {
	private static ProductDAO pDAO = new ProductDAO();
	private DataSource ds = null;
	
	private ProductDAO() {
		try {
			Context con = new InitialContext();
			Context envcon = (Context) con.lookup("java:/comp/env");
			ds = (DataSource) envcon.lookup("jdbc/oracle88");
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static ProductDAO getInstance() {
		return pDAO;
	}
	
//	public ProductVO getProduct(String pno) {
//		
//		
//	}
}