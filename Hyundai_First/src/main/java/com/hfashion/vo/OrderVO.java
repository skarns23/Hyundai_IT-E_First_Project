package com.hfashion.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * 남승현 작성
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderVO {
	private String  order_no;
	private String brand_name;
	private String pro_name;
	private String product_option;
	private int order_amount;
	private int pro_price;
	private int review_check;
	private String pro_no;
	private Date  order_date;
	private String img_url;
	private int order_check;
	private Date cancle_date;
}
