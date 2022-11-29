package com.hfashion.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.hfashion.dao.ProductSortDAO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;
import com.hfashion.vo.ProductDTO;
import com.hfashion.vo.ProductSortDTO;

/*
 * 함세강 작성
 */
public class ProductListSortService {
	private ProductListSortService() {}
	private static ProductListSortService instance=null;
	public static ProductListSortService getInstance() {
		if(instance == null) {
			instance = new ProductListSortService();
		}
		return instance;
	}
	
	public List<ProductDTO> getProductSortList(ProductSortDTO dto){
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		Connection con = null;
		ProductSortDAO dao = null;
		String gender = dto.getGender();
		try {
			con = ConnectionProvider.getConnection();
			
			dao = ProductSortDAO.getInstance();
			
			
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		
		
		
		
		
		
		
		return list;
	}
	
}
