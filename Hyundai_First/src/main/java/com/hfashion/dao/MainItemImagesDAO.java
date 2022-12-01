package com.hfashion.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;


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
		
		/* String runProcedure = "{call }"; */
		
		/* CallableStatement cstmt = con.prepareCall(proNo); */
		
		
		
		
		return list;
	}
	
	
}
