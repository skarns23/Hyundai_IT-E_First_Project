package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;
import com.hfashion.vo.OrderVO;

import oracle.jdbc.OracleType;
import oracle.jdbc.OracleTypes;

public class OrderDAO {
	private String getOrderList = "{call get_order_list(?,?,?,?)}";
	private static OrderDAO instance = null;

	private OrderDAO() {
	}

	public static OrderDAO getInstance() {
		if (instance == null) {
			instance = new OrderDAO();
		}
		return instance;
	}

	public List<OrderVO> getOrderList(String user_id, String start, String end) {
		List<OrderVO> result = new ArrayList<>();
		System.out.println("getOrderList 메서드 실행");
		System.out.println(user_id);
		System.out.println(start);
		System.out.println(end);
		try{
			Connection conn = ConnectionProvider.getConnection();
			CallableStatement cstmt = conn.prepareCall(getOrderList);
			cstmt.setString(1, user_id);
			cstmt.setString(2, start);
			cstmt.setString(3, end);
			cstmt.registerOutParameter(4, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(4);
			while(rs.next()) {
				String brand_name = rs.getString(1);
				String pro_name = rs.getString(2);
				String pro_option = rs.getString(3);
				int order_amount = rs.getInt(4);
				int pro_price = rs.getInt(5);
				int review_check = rs.getInt(6);
				String pro_no = rs.getString(7);
				String order_no = rs.getString(8);
				Date order_date =rs.getDate(9);
				String img_url = rs.getString(10);
				OrderVO oVO = new OrderVO(order_no,brand_name,pro_name,pro_option,order_amount,pro_price,review_check,pro_no,order_date,img_url);
				result.add(oVO);
			}
			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			JdbcUtil.close(conn);
			
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
