package com.hfashion.dao;

/*
 * 남승현 작성 
 */
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.hfashion.dto.OrderDTO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;

import oracle.jdbc.OracleType;
import oracle.jdbc.OracleTypes;

public class OrderDAO {
	private String getOrderList = "{call order_package.get_order_list(?,?,?,?)}";
	private String cancleOrder = "{call order_package.order_cancle(?,?,?,?)}";
	private static OrderDAO instance = null;
	private OrderDAO() {
	}
	
	/*
	 * 기능 : 싱글턴 패턴에서의 인스턴스를 반환하는 메서드 
	 */
	public static OrderDAO getInstance() {
		if (instance == null) {
			instance = new OrderDAO();
		}
		return instance;
	}
	
	/*
	 * 기능 : 주문취소 기능 
	 * 입력 : 주문 번호, 사용자 아이디, 상품 번호, 상품 사이즈 옵션  
	 * 출력 : 수행 후 영향받은 행의 수 반환
	 * 기타 : 주문취소 시 주문취소 날짜가 갱신되며, 해당 상품의 재고를 트리거를 통해 취소 수량만큼 상승시켜줌  
	 */	
	public int cancleOrder(String order_no,String user_id, String pro_no, String size_name) {
		int result = 0;
		try {
			Connection conn = ConnectionProvider.getConnection();
			CallableStatement cstmt = conn.prepareCall(cancleOrder);
			cstmt.setString(1, order_no);
			cstmt.setString(2, user_id);
			cstmt.setString(3, pro_no);
			cstmt.setString(4, size_name);
			result = cstmt.executeUpdate();
			JdbcUtil.close(cstmt);
			JdbcUtil.close(conn);
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/*
	 * 기능 : 주어진 기간의 주문내역을 조회하여 반환하는 기능 
	 * 입력 : 사용자 아이디, 조회 시작일, 조회 종료일  
	 * 출력 : 주어진 기간내의 사용자의 주문내역을 List에 담아 반환 
	 * 기타 : 검색된 데이터를 CURSOR를 활용하여 반환
	 *        이후 ResultSet의 컬럼을 추출하여 인스턴스를 만든 뒤 List에 담아 반환
	 */
	public List<OrderDTO> getOrderList(String user_id, String start, String end) {
		List<OrderDTO> result = new ArrayList<>();
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
				int order_check = rs.getInt(11);
				Date cancle_date = rs.getDate(12);
				OrderDTO oVO = new OrderDTO(order_no,brand_name,pro_name,pro_option,order_amount,pro_price,review_check,pro_no,order_date,img_url,order_check,cancle_date);
				result.add(oVO);
			}
			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			JdbcUtil.close(conn);
		}catch (SQLException e) {e.printStackTrace();} 
		catch (NamingException e) {e.printStackTrace();}
		return result;
	}
}


