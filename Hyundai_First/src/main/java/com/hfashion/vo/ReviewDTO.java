package com.hfashion.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReviewDTO {
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
