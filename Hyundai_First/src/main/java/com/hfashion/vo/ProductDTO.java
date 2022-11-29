package com.hfashion.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


/*
 * 신수진, 함세강 작성
 */
@Getter
@Setter
@NoArgsConstructor
public class ProductDTO {
	private String pro_no;
	private String pro_name;
	private int pro_price;
	private String pro_price_f;
	private String pro_gender;
	private String brand_name;
	private String img_loc;
	private String category;
	
	public ProductDTO(String pro_no) {
		this.pro_no = pro_no;
	}
	
	
	
}
