package com.hfashion.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {
	private int cart_amount;
	private String size_name;
	private String user_id;
	private String pro_no;
	private String pro_name;
	private int pro_price;
	private String brand_name;
	private String img_loc;
	private int selected;
	
	public CartVO(int cart_amount, String size_name, String user_id, String pro_no, String pro_name, int pro_price, String brand_name, String img_loc, int selected) {
		this.cart_amount = cart_amount;
		this.size_name = size_name;
		this.user_id = user_id;
		this.pro_no = pro_no;
		this.pro_name = pro_name;
		this.pro_price = pro_price;
		this.brand_name = brand_name;
		this.img_loc = img_loc;
		this.selected = selected;
	}
	
	public CartVO(String pro_no, String size_name, int cart_amount, String user_id) {
		this.pro_no = pro_no;
		this.size_name = size_name;
		this.cart_amount = cart_amount;
		this.user_id = user_id;
	}
}
