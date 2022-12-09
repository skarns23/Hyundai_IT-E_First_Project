package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hfashion.util.JdbcUtil;

import oracle.jdbc.OracleTypes;


public class MainItemImagesDAO {
	//싱글톤 선언
	private MainItemImagesDAO() {};
	private static MainItemImagesDAO instance=null;
	public static MainItemImagesDAO getInstance() {
		if(instance == null) {
			instance = new MainItemImagesDAO();
		}
		return instance;
	}
	
	
	//상품 번호를 매개변수로 받아 해당하는 이미지들을 가져오는 메서드
	public List<String> getMainImages(Connection con, String proNo) {
		List<String> list = new ArrayList<String>();
		
		String runProcedure = "{call main_get_images(?,?)}";	//상품의 이미지를 가져오는 프로시저 호출
		
		try {
			CallableStatement cstmt = con.prepareCall(runProcedure);
			
			cstmt.setString(1, proNo);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			cstmt.execute();
			
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			
			while(rs.next()) { //상품에 해당하는 여러장의 이미지를 반복문을 통해 list에 담는 과정
				String img = rs.getString(1);
				list.add(img);				
			}

			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		

		return list;
	}
	
	
}
