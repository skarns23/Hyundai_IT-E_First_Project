package com.hfashion.vo;

import java.text.DecimalFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductVO {
	private String pro_no;
	private String pro_name;
	private int pro_price;
	private String pro_price_f;
	private String pro_gender;
	private String brand_name;
	
	public ProductVO() {}
	
	public ProductVO(String pro_no) {
		this.pro_no = pro_no;
	}
	
	public String getPro_price_f() {
		DecimalFormat decFormat = new DecimalFormat("###,###");
		return decFormat.format(this.pro_price);
	}
	
	
	
}
