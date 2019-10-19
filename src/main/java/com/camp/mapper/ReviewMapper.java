package com.camp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.camp.vo.PTReview;
import com.camp.vo.Review;

@Mapper
public interface ReviewMapper {
 /////////////////////////////////camp review//////////////////////////
	void insertReview(Review review);

	Review selectReviewByRentNo(int rentNo);

	void updateReview(Review review);

	void deleteReview(int reviewNo);

	void BuyFlag(int buyNo);

	void RentFlag(int rentNo);
	void zeroRentFlag(int rentNo);
	//////////////////////////////////product review////////////////////////
	void insertptReview(PTReview ptreview);

	PTReview selectptReviewByBuyNo(int buyNo);

	void updateptReview(PTReview ptreview);

	void zeroBuyFlag(int buyNo);

	void deleteptReview(int ptreviewNo);

}
