package com.hfashion.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/*
 * 함세강 작성
 */
@Setter
@Getter
@NoArgsConstructor
public class ProductSortDTO {
	private String gender;
	private String category;
	
	public ProductSortDTO(String gender, String category) {
		this.gender = gender;
		this.category = category;
	}
	
}
