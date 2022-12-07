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
public class ProductBestDAO {
	//싱글톤 생성
	private ProductBestDAO() {};
	private static ProductBestDAO instance=null;
	public static ProductBestDAO getInstance() {
		if(instance ==null) {
			instance = new ProductBestDAO();
		}
		return instance;
	}
	
	
	//best 상품 데이터 가져오는 DAO
	public List<ProductDTO> getProductBest(Connection con){
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		String runProcedure = "{call best_package.pro_best(?)}";
		
		try {
			CallableStatement cstmt = con.prepareCall(runProcedure);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			
			ResultSet rs = (ResultSet)cstmt.getObject(1);			
			while(rs.next()) {
				String pro_no = rs.getString(1);
				String pro_name= rs.getString(2);
				int pro_price= rs.getInt(3);
				String img_loc= rs.getString(4);
				String brand_name = rs.getString(5);
				String cnt_rev = rs.getString(8);
				
				ProductDTO dto = new ProductDTO();
				
				dto.setPro_no(pro_no);
				dto.setPro_name(pro_name);
				dto.setPro_price(pro_price);
				dto.setImg_loc(img_loc);
				dto.setBrand_name(brand_name);
				dto.setReviewCnt(cnt_rev);
				
				list.add(dto);

			}
			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 

		return list;
	}
	
	
	//best 상품에서 카레고리별로 상품 가져오기
	public List<ProductDTO> getProductSortBest(Connection con, String gender){
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		String runProcedure = "{call best_package.pro_best(?,?)}";
		
		try {
			CallableStatement cstmt = con.prepareCall(runProcedure);
			
			cstmt.setString(1, gender);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			cstmt.execute();
			
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			
			while(rs.next()) {
				String pro_no = rs.getString(1);
				String pro_name= rs.getString(2);
				int pro_price= rs.getInt(3);
				String img_loc= rs.getString(4);
				String brand_name = rs.getString(5);
				String cnt_rev = rs.getString(8);
				
				ProductDTO dto = new ProductDTO();
				
				dto.setPro_no(pro_no);
				dto.setPro_name(pro_name);
				dto.setPro_price(pro_price);
				dto.setImg_loc(img_loc);
				dto.setBrand_name(brand_name);
				dto.setReviewCnt(cnt_rev);
				
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
