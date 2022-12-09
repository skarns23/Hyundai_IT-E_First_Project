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

import com.hfashion.dto.CartDTO;

import oracle.jdbc.OracleTypes;

/*
 * 신수진 작성
 * */
public class CartDAO {
	
	// 싱글톤 패턴 적용
	private static CartDAO cDAO = new CartDAO();
	private DataSource ds = null;
	private String selectCart = "{call cart_pack.select_cart(?, ?)}";
	private String insertCart = "{call cart_pack.update_or_insert_cart(?, ?, ?, ?)}";
	private String delCart = "{call cart_pack.del_cart(?, ?, ?)}";
	private String delAllCart = "{call cart_pack.del_all_cart(?)}";
	private String selUpdateCart = "{call cart_pack.sel_update_cart(?, ?, ?)}";
	private String cntUpdateCart = "{call cart_pack.amount_update_cart(?, ?, ?, ?)}";
	
	private CartDAO() {
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
	 * 기능 : 선택한 옵션을 장바구니에 담는 기능
	 * 입력 : 상품 번호, 사이즈, 사용자 아이디, 수량
	 * 출력 : 상품 등록 결과 반환
	 * */
	public boolean insertCart(CartDTO cart) {
		int rs = 0;
		
		try(Connection conn = ds.getConnection();
				CallableStatement cstmt = conn.prepareCall(insertCart)){
			cstmt.setString(1, cart.getPro_no());
			cstmt.setString(2, cart.getSize_name());
			cstmt.setString(3, cart.getUser_id());
			cstmt.setInt(4, cart.getCart_amount());
			rs = cstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		// 상품을 등록하지 못한 경우 0, 등록한 경우 insert한 행의 수
		return rs == 0 ? false : true;
	}
	
	/*
	 * 기능 : 사용자가 담아둔 장바구니 목록을 조회하여 반환하는 기능
	 * 입력 : 사용자의 아이디
	 * 출력 : 사용자가 담아둔 장바구니 목록을 List에 담아 반환
	 * 기타 : 검색된 데이터를 CURSOR를 활용하여 반환
	 * 			ResultSet의 커럼을 추출하여 List에 담아 반환
	 * */
	public List<CartDTO> selectCart(String user_id){
		List<CartDTO> cList = new ArrayList<>();
		
		try(Connection conn = ds.getConnection();
				CallableStatement cstmt = conn.prepareCall(selectCart);){
			cstmt.setString(1, user_id);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			try {
				cstmt.executeQuery();
				ResultSet rs = (ResultSet) cstmt.getObject(2);
				
				while(rs.next()) {
					CartDTO cDTO;
					int cart_amount = rs.getInt(1);
					String size_name = rs.getString(2);
					String id = rs.getString(3);
					String pro_no = rs.getString(4);
					String pro_name = rs.getString(5);
					int pro_price = rs.getInt(6);
					String brand_name = rs.getString(7);
					String img_loc = rs.getString(8);
					int selected = rs.getInt(9);
					cDTO = new CartDTO(cart_amount, size_name, id, pro_no, pro_name, pro_price, brand_name, img_loc, selected);
					cList.add(cDTO);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return cList;
	}
	
	/*
	 * 기능 : 사용자가 장바구니에서 선택한 1개의 상품을 삭제하는 기능
	 * 입력 : 상품 번호, 사이즈, 사용자 아이디
	 * */
	public void delCart(String pro_no, String size_name, String user_id) {
		try(Connection conn = ds.getConnection();
				CallableStatement cstmt = conn.prepareCall(delCart)){
			cstmt.setString(1, pro_no);
			cstmt.setString(2, size_name);
			cstmt.setString(3, user_id);
			cstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}

	}

	/*
	 * 기능 : 사용자의 장바구니에 담긴 모든 상품을 삭제하는 기능
	 * 입력 : 사용자 아이디
	 * */
	public void delAllCart(String user_id) {
		try(Connection conn = ds.getConnection();
				CallableStatement cstmt = conn.prepareCall(delAllCart)){
			cstmt.setString(1, user_id);
			cstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 기능 : 장바구니에 담긴 상품의 선택 유무 상태를 변경하는 기능 
	 * 입력 : 상품 번호, 사이즈, 사용자 아이디
	 * 기타 : 상품의 선택 상태에 따라 선택(1) or 해제(0) 상태로 변경
	 * */
	public void selUpdateCart(String pro_no, String size_name, String user_id) {
		try(Connection conn = ds.getConnection();
				CallableStatement cstmt = conn.prepareCall(selUpdateCart)){
			cstmt.setString(1, user_id);
			cstmt.setString(2, pro_no);
			cstmt.setString(3, size_name);
			cstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 기능 : 장바구니에 저장된 상품의 수량을 변경하는 기능
	 * 입력 : 사용자 아이디, 상품 번호, 사이즈, 변경된 수량
	 * */
	public void cntUpdateCart(String user_id, String pro_no, String size_name, int cnt) {
		try(Connection conn = ds.getConnection();
				CallableStatement cstmt = conn.prepareCall(cntUpdateCart)){
			cstmt.setInt(1, cnt);
			cstmt.setString(2, user_id);
			cstmt.setString(3, pro_no);
			cstmt.setString(4, size_name);
			cstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static CartDAO getInstance() {
		return cDAO;
	}
}
