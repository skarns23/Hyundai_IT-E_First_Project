package com.hfashion.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.hfashion.dao.ProductBestDAO;
import com.hfashion.dto.ProductDTO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;

/*
 * 함세강 작성
 */
public class ProductBestService {
	//싱글톤 선언
	private ProductBestService() {}
	private static ProductBestService instance=null;
	public static ProductBestService getInstance() {
		if(instance ==null) {
			instance = new ProductBestService();
		}
		return instance;
	}

	
	public List<ProductDTO> productBestListService(String gender){
		List<ProductDTO> list = null;
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductBestDAO dao = ProductBestDAO.getInstance();
			list = dao.getProductSortBest(con,gender);
			
			return list;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		
	}
	
	// 베스트 정렬 불러오기
	public List<ProductDTO> productBestSortListService(String gender){
		List<ProductDTO> list = null;
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			ProductBestDAO dao = ProductBestDAO.getInstance();	
			list = dao.getProductSortBest(con, gender);
			
			return list;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException();
			
		}finally {
			JdbcUtil.close(con);
		}
		
	}
	
	
	
	
	
}
