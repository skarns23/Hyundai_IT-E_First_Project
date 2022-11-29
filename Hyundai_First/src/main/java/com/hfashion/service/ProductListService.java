package com.hfashion.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.hfashion.dao.ProdcutTestDAO;
import com.hfashion.dao.ProductDAO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;
import com.hfashion.vo.CategoryDTO;
import com.hfashion.vo.ProductTestVO;

/*
 * 함세강 작성
 */
public class ProductListService {
	//싱글톤 선언
	private ProductListService() {};
	private static ProductListService instance = null;
	public static ProductListService getInstance(){
		if(instance==null){
			instance = new ProductListService();
		}
		return instance;
	}
	
	
	//상품 목록 불러 오는 메서드
	public List<ProductTestVO> productGetList(CategoryDTO dto){
		List<ProductTestVO> list=null;
		Connection con = null;
		
		String category = dto.getCategory();
		
		try {
			con = ConnectionProvider.getConnection();
			ProdcutTestDAO dao = ProdcutTestDAO.getInstance();
			list = dao.ProductList(con,category);

		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		

		return list; 
	}
	
	
	
}
