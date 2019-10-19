package com.camp.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Review {	
	
	private int reviewNo;
	private String title;
	private String content;
	private String category;
	private Date regDate;
	private String memberId;
	private int rentNo;
	
	private int campNo;
	
} 
