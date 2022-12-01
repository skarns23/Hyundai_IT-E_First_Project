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
	
	
	public List<String> getMainImages(Connection con, String proNo) {
		List<String> list = new ArrayList<String>();
		
		String runProcedure = "{call main_get_images(?,?)}";
		
		try {
			CallableStatement cstmt = con.prepareCall(runProcedure);
			
			cstmt.setString(1, proNo);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			cstmt.execute();
			
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			
			while(rs.next()) {		
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
