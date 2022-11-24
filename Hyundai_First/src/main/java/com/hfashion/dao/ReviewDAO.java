package com.hfashion.dao;

import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {

	private static ReviewDAO RDAO = new ReviewDAO();
	private DataSource ds = null;
	private String insert = "{call insert_member(?,?,?,?,?)}";

	public ReviewDAO() {
		try {
			Context con = new InitialContext();
			Context envcon = (Context) con.lookup("java:/comp/env");
			ds = (DataSource) envcon.lookup("jdbc/oracle88");

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	// 리뷰 목록 조회
	public List reviewList() {
		List list = new ArrayList();
		try {
			//con=dataFactory.getConnection();
			String query = "select * from review";
		   
			
			
		}catch(Exception e){
	        e.printStackTrace();
		}
		return list; 
    	
    	
    }

	// 리뷰 삭제 delete
	// 리뷰 목록
	// 리뷰 수정 update

}
