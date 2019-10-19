package com.camp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.mapper.ReviewMapper;
import com.camp.vo.PTReview;
import com.camp.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public void writeReview(Review review) {
		reviewMapper.insertReview(review);
	}

	@Override
	public Review findReviewByRentNo(int rentNo) {
		Review review = reviewMapper.selectReviewByRentNo(rentNo);
		return review;
	}


	@Override
	public void updateReview(Review review) {
		reviewMapper.updateReview(review);
		
	}

	@Override
	public void deleteReview(int reviewNo) {
		reviewMapper.deleteReview(reviewNo);
		
	}


	@Override
	public void updateBuyFlag(int buyNo) {
		reviewMapper.BuyFlag(buyNo);
		
	}

	@Override
	public void updateRentFlag(int rentNo) {
		reviewMapper.RentFlag(rentNo);
		
	}
	
	@Override
	public void zeroRentalFlag(int rentNo) {
		reviewMapper.zeroRentFlag(rentNo);
		
	}
	
	///////////product review ///////////////////////////////
	@Override
	public void writeptReview(PTReview ptreview) {
		reviewMapper.insertptReview(ptreview);
	}

	@Override
	public PTReview findptReviewByBuyNo(int buyNo) {
		PTReview ptreview = reviewMapper.selectptReviewByBuyNo(buyNo);
		return ptreview;
		
	}


	@Override
	public void updateptReview(PTReview ptreview) {
		reviewMapper.updateptReview(ptreview);
		
	}

	@Override
	public void zeroBuyFlag(int buyNo) {
		reviewMapper.zeroBuyFlag(buyNo);
		
	}


	@Override
	public void deleteptReview(int ptreviewNo) {
		reviewMapper.deleteptReview(ptreviewNo);
		
	}


}

