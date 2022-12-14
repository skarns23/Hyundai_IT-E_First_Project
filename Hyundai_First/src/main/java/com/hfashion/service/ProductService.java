package com.hfashion.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.hfashion.dao.ProductSortDAO;
import com.hfashion.dto.CategoryDTO;
import com.hfashion.dto.ProductDTO;
import com.hfashion.dto.ProductSortDTO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;

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
	public List<ProductDTO> productGetListService(CategoryDTO dto){
		List<ProductDTO> list=null;
		Connection con = null;
		
		String category = dto.getCategory();
		try {
			con = ConnectionProvider.getConnection();
			ProductSortDAO dao = ProductSortDAO.getInstance();
			
			list = dao.ProductList(con,category);
			//카테고리를 입력받아 상품 목록별 데이터를 가져오는 dao 메서드 호출
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}

		return list; 
	}
	
	
	//정렬된 상품 목록 불러오는 메서드
	public List<ProductDTO> productGetSortList(ProductSortDTO dto){
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		Connection con = null;
		ProductSortDAO dao = null;
		String gender = dto.getGender();
		String category = dto.getCategory();
		try {
			con = ConnectionProvider.getConnection();
			dao = ProductSortDAO.getInstance();
			list = dao.getProductSort(con, gender,category);
			//성별과 카테고리를 입력받아 정렬된 데이터들을 가져오는 dao 메서드 호출
				
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		
		return list;
	}
	
	
	
	
}
