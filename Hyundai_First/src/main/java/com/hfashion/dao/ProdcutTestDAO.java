package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hfashion.util.JdbcUtil;
import com.hfashion.vo.ProductTestVO;

import oracle.jdbc.OracleTypes;

public class ProdcutTestDAO {

	private ProdcutTestDAO(){};
	private static ProdcutTestDAO instance = null;
	public static ProdcutTestDAO getInstance() {
		if(instance==null) {
			instance = new ProdcutTestDAO();
		}
		return instance;
	}
	
	
	public List<ProductTestVO> ProductList(Connection con, String category) {
		List<ProductTestVO> list = new ArrayList<ProductTestVO>();
		
		
		String runProcedure = "{call product_pack.pro_list(?,?)}";
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
				
				ProductTestVO vo = new ProductTestVO();
				
				vo.setPro_no(pro_no);
				vo.setPro_name(pro_name);
				vo.setPro_price(pro_price);
				vo.setImg_loc(img_loc);
				vo.setBrand_name(brand_name);
				
				list.add(vo);
			}
			
			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			
		} catch (SQLException e) {	
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		return list;
	}
	
	
	
}
