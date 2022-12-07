package com.hfashion.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CategoryDTO {

	private String category;
	
	public CategoryDTO(String  category) {
		this.category = category;
	}
	
}
