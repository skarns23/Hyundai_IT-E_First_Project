package com.hfashion.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.hfashion.dao.ProdcutTestDAO;
import com.hfashion.dao.ProductDAO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.vo.ProductTestVO;

/*
 * 함세강 작성
 */

public class ProductService {
	//싱글톤 선언
	private ProductService() {};
	private static ProductService instance = null;
	public static ProductService getInstance(){
		if(instance==null){
			instance = new ProductService();
		}
		return instance;
	}
	
	
	//상품 목록 불러 오는 메서드
	public List<ProductTestVO> productGetList(){
		System.out.println("상품 서비스 호출 on");
		List<ProductTestVO> list=null;
		
		
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProdcutTestDAO dao = ProdcutTestDAO.getInstance();
			list = dao.ProductList(con);
			
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return list; 
	}
	
	
	
}
