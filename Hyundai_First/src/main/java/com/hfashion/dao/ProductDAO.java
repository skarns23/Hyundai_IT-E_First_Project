package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hfashion.vo.ProductVO;
import com.hfashion.vo.SizeVO;

import oracle.jdbc.OracleTypes;

/*
 * 신수진 작성
 * */
public class ProductDAO {
	private static ProductDAO pDAO = new ProductDAO();
	private DataSource ds = null;
	private String selectDetail = "{call select_product_detail(?, ?, ?, ?, ?)}";
	private String selectDetailSize = "{call select_product_detail_size(?, ?)}";
	
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
	
	// 신수진 - 상품 상세 정보 select
	public ProductVO productDetail(String pro_no){
		ProductVO pVO = new ProductVO();
		
		try(Connection conn = ds.getConnection(); 
				CallableStatement cstmt = conn.prepareCall(selectDetail);){
			cstmt.setString(1, pro_no);
			cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(3, java.sql.Types.NUMERIC);
			cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
			cstmt.executeQuery();
		
			String pro_name = cstmt.getString(2);
			int pro_price = cstmt.getInt(3);
			String pro_gender = cstmt.getString(4);
			String brand_name = cstmt.getString(5);
			
			pVO.setPro_name(pro_name);
			pVO.setPro_price(pro_price);
			if(pro_gender.equals("남성")) {
				pVO.setPro_gender("MAN");
			}else if(pro_gender.equals("여성")) {
				pVO.setPro_gender("WOMAN");
			}else {
				pVO.setPro_gender("ALL");
			}
			pVO.setBrand_name(brand_name);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return pVO;
	}
	
	// 신수진 - 상품 상세 정보 size select 
	public List<SizeVO> productDetailSize(String pro_no){
		List<SizeVO> sList = new ArrayList<>();
		
		try(Connection conn = ds.getConnection();
				CallableStatement cstmt = conn.prepareCall(selectDetailSize)){
			cstmt.setString(1, pro_no);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			try{
				cstmt.executeQuery();
				ResultSet rs = (ResultSet) cstmt.getObject(2);
				
				while(rs.next()) {
					SizeVO sVO = new SizeVO();
					String size_name = rs.getString(1);
					sVO.setSize_name(size_name);
					sList.add(sVO);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return sList;
	}
	
	
	public static ProductDAO getInstance() {
		return pDAO;
	}
	
}