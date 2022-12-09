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

import com.hfashion.dto.ImgDTO;
import com.hfashion.dto.ProductDTO;
import com.hfashion.dto.SizeDTO;

import oracle.jdbc.OracleTypes;

/*
 * 신수진 작성
 * */
public class ProductDAO {
	
	// 싱글톤 패턴 적용
	private static ProductDAO pDAO = new ProductDAO();
	private DataSource ds = null;
	private String selectDetail = "{call select_product_detail(?, ?, ?, ?, ?)}";
	private String selectDetailSize = "{call select_product_detail_size(?, ?)}";
	private String selectDetailImg = "{call select_pro_detail_img(?, ?)}";
	
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
	
	/*
	 * 기능 : 상품 목록에서 선택한 상품의 상세 정보를 반환하는 기능
	 * 입력 : 상품 번호
	 * 출력 : 상품 정보를 담은 DTO
	 * */
	public ProductDTO productDetail(String pro_no){
		ProductDTO pDTO = new ProductDTO();
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
			
			pDTO.setPro_name(pro_name);
			pDTO.setPro_price(pro_price);
			if(pro_gender.equals("남성")) {
				pDTO.setPro_gender("MAN");
			}else if(pro_gender.equals("여성")) {
				pDTO.setPro_gender("WOMAN");
			}else {
				pDTO.setPro_gender("ALL");
			}
			pDTO.setBrand_name(brand_name);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return pDTO;
	}
	
	/*
	 * 기능 : 해당 상품의 사이즈 정보를 조회해 반환하는 기능
	 * 입력 : 상품 번호
	 * 출력 : 상품 사이즈 정보를 담은 List
	 * 기타 : 검색된 데이터를 CURSOR를 활용하여 반환
	 * 			ResultSet의 커럼을 추출하여 List에 담아 반환
	 * */
	public List<SizeDTO> productDetailSize(String pro_no){
		List<SizeDTO> sList = new ArrayList<>();
		
		try(Connection conn = ds.getConnection();
				CallableStatement cstmt = conn.prepareCall(selectDetailSize)){
			cstmt.setString(1, pro_no);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			try{
				cstmt.executeQuery();
				ResultSet rs = (ResultSet) cstmt.getObject(2);
				
				while(rs.next()) {
					SizeDTO sDTO = new SizeDTO();
					String size_name = rs.getString(1);
					sDTO.setSize_name(size_name);
					sList.add(sDTO);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return sList;
	}
	
	/*
	 * 기능 : 해당 상품의 이미지를 조회해 반환하는 기능
	 * 입력 : 상품 번호
	 * 출력 :
	 * 기타 : 검색된 데이터를 CURSOR를 활용하여 반환
	 * 			ResultSet의 커럼을 추출하여 List에 담아 반환
	 * */
	public List<ImgDTO> productDetailImg(String pro_no){
		List<ImgDTO> imgList = new ArrayList<>();
		
		try(Connection conn = ds.getConnection();
				CallableStatement cstmt = conn.prepareCall(selectDetailImg)){
			cstmt.setString(1, pro_no);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			try {
				cstmt.executeQuery();
				ResultSet rs = (ResultSet) cstmt.getObject(2);
				
				while(rs.next()) {
					ImgDTO imgDTO = new ImgDTO();
					String img_loc = rs.getString(2);
					imgDTO.setPro_no(pro_no);
					imgDTO.setImg_loc(img_loc);
					imgList.add(imgDTO);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return imgList;
	}
	
	
	public static ProductDAO getInstance() {
		return pDAO;
	}
	
}