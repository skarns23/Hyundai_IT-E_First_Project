package com.hfashion.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CartDTO {
	
	private int cartAmount;
	private int proPrice;
	private String proSize;
	private String brandName;
	private String proName;
	private String proImage;

}
