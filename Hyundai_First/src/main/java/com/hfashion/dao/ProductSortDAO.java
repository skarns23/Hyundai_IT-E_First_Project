package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hfashion.dto.ProductDTO;
import com.hfashion.util.JdbcUtil;

import oracle.jdbc.OracleTypes;


/*
 * 함세강 작성
 */
public class ProductSortDAO {
	
	//싱글톤 작성
	private ProductSortDAO(){};
	private static ProductSortDAO instance = null;
	public static ProductSortDAO getInstance() {
		if(instance==null) {
			instance = new ProductSortDAO();
		}
		return instance;
	}
	
	//상품 목록 데이터 가져오기
	public List<ProductDTO> ProductList(Connection con, String category) {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		String runProcedure = "{call product_pack.pro_list(?,?)}";
		//카테고리를 매개변수로 입력받아 데이터를 불러오는 프로시저 호출
		
		try {
			CallableStatement cstmt = con.prepareCall(runProcedure);
			
			cstmt.setString(1, category);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.execute();
			
			
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			
			
			while(rs.next()) {
				String pro_no = rs.getString(1);
				String pro_name= rs.getString(2);
				int pro_price= rs.getInt(3);
				String img_loc= rs.getString(4);
				String brand_name = rs.getString(5);
				
				ProductDTO dto = new ProductDTO();
				
				dto.setPro_no(pro_no);
				dto.setPro_name(pro_name);
				dto.setPro_price(pro_price);
				dto.setImg_loc(img_loc);
				dto.setBrand_name(brand_name);
				dto.setCategory(category);
				
				list.add(dto);
			}
			
			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			
		} catch (SQLException e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	//상품 ajax요청시 카테고리별 정렬해서 데이터 가져오는 메서드
	public List<ProductDTO> getProductSort(Connection con,String gender, String category){
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		String runProcedure = "{call product_pack.pro_list(?,?,?)}";
		//성별과 카테고리를 매개변수로 입력받아서 정렬된 데이터를 가져오는 프록시저 호출
		
		try {
			CallableStatement cstmt = con.prepareCall(runProcedure);
			cstmt.setString(1, gender);
			cstmt.setString(2, category);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			cstmt.execute();
			
			ResultSet rs = (ResultSet)cstmt.getObject(3);
			
			while(rs.next()) {
				String pro_no = rs.getString(1);
				String pro_name= rs.getString(2);
				int pro_price= rs.getInt(3);
				String img_loc= rs.getString(4);
				String brand_name = rs.getString(5);
				
				ProductDTO dto = new ProductDTO();
				
				dto.setPro_no(pro_no);
				dto.setPro_name(pro_name);
				dto.setPro_price(pro_price);
				dto.setImg_loc(img_loc);
				dto.setBrand_name(brand_name);
				dto.setCategory(category);
				
				list.add(dto);
				
			}
			
			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	
}
