package com.hfashion.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * 남승현 작성
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReviewSearchDTO {
	private String review_no;
	private int review_like;
	private String review_title;
	private String review_content;
	private String review_img;
	private String review_date;
	private int weight;
	private int height;
	private int start_rating;
	private String product_option;
	private String order_no;
	private String user_id;
}
