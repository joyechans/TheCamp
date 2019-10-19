package com.camp.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PTReview {	
	
	private int ptreviewNo;
	private String title;
	private String content;
	private Date regDate;
	private String memberId;
	private int buyNo;
	
	private int productNo;
	
} 
