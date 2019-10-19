package com.camp.service;

import com.camp.vo.PTReview;
import com.camp.vo.Review;

public interface ReviewService {
	
	///////////////////////////////////camp review
	void writeReview(Review review);

	Review findReviewByRentNo(int rentNo);

	void updateReview(Review review);

	void deleteReview(int reviewNo);

	void updateBuyFlag(int buyNo);

	void updateRentFlag(int rentNo);
	void zeroRentalFlag(int rentNo);
	
	///////////////////////////////////product review
	void writeptReview(PTReview ptreview);

	PTReview findptReviewByBuyNo(int buyNo);

	void updateptReview(PTReview ptreview);

	void zeroBuyFlag(int buyNo);

	void deleteptReview(int ptreviewNo);


}
