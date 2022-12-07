package com.hfashion.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CartOrderDTO {
	
	private int cartAmount;
	private int proPrice;
	private String proSize;
	private String brandName;
	private String proName;
	private String proImage;

}
