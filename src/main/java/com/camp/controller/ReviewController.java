package com.camp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.camp.service.ReviewService;
import com.camp.vo.Member;
import com.camp.vo.PTReview;
import com.camp.vo.Review;

@Controller
@RequestMapping(path = "/review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping(path = "/reviewWrite", method = RequestMethod.GET)
	public String reviewWriteFrom(Review review, Model model) {
		
		model.addAttribute("review",review);
		return "review/reviewWrite";
	}
	
	@RequestMapping(path = "/ptreviewWrite", method = RequestMethod.GET)
	public String ptreviewWriteFrom(PTReview ptreview, Model model) {
		
		
		model.addAttribute("ptreview",ptreview);
		return "review/ptreviewWrite";
	}
	
	@RequestMapping(path = "/reviewWrite", method = RequestMethod.POST)
	public String reviewUpload(Review review, HttpSession session) {
		
		Member loginuer = (Member)session.getAttribute("loginuser");
		review.setMemberId(loginuer.getMemberId());
		
		reviewService.updateRentFlag(review.getRentNo());			
		reviewService.writeReview(review);

		return "redirect:/member/orderlist?memberId="+review.getMemberId();
	}
	
	@RequestMapping(path = "/ptreviewWrite", method = RequestMethod.POST)
	public String ptreviewUpload(PTReview ptreview, HttpSession session) {
		
		Member loginuer = (Member)session.getAttribute("loginuser");
		ptreview.setMemberId(loginuer.getMemberId());
		
		reviewService.updateBuyFlag(ptreview.getBuyNo());			
		reviewService.writeptReview(ptreview);

		return "redirect:/member/orderlist?memberId="+ptreview.getMemberId();
	}
	
	@RequestMapping(path = "/reviewUpdate", method = RequestMethod.GET)
	public String reviewUpdateFrom(int rentNo, Model model) {
		
		Review review = reviewService.findReviewByRentNo(rentNo);		
		model.addAttribute("review", review);

		return "review/reviewUpdate";
	}
	
	@RequestMapping(path = "/ptreviewUpdate", method = RequestMethod.GET)
	public String ptreviewUpdateFrom(int buyNo, Model model) {
		
		PTReview ptreview = reviewService.findptReviewByBuyNo(buyNo);
		model.addAttribute("ptreview", ptreview);

		return "review/ptreviewUpdate";
	}
	
	@RequestMapping(path = "/reviewUpdate", method = RequestMethod.POST)
	public String campUpdate(Review review, String memberId, HttpSession session, Model model) {

		reviewService.updateReview(review);
		model.addAttribute("review", review);

		return  "redirect:/member/orderlist?memberId="+memberId;

	}
	
	@RequestMapping(path = "/ptreviewUpdate", method = RequestMethod.POST)
	public String productUpdate(PTReview ptreview, String memberId, HttpSession session, Model model) {
	
		reviewService.updateptReview(ptreview);
		model.addAttribute("ptreview", ptreview);
		
		return  "redirect:/member/orderlist?memberId="+memberId;

	}
	
	@RequestMapping(path = "/reviewDelete", method = RequestMethod.GET)
	public String delete(int rentNo, String memberId) {
		reviewService.zeroRentalFlag(rentNo);
		Review review = reviewService.findReviewByRentNo(rentNo);
		reviewService.deleteReview(review.getReviewNo());

		return "redirect:/member/orderlist?memberId="+memberId;
	}
	
	@RequestMapping(path = "/ptreviewDelete", method = RequestMethod.GET)
	public String ptdelete(int buyNo, String memberId) {
		reviewService.zeroBuyFlag(buyNo);
		PTReview ptreview = reviewService.findptReviewByBuyNo(buyNo);
		reviewService.deleteptReview(ptreview.getPtreviewNo());

		return "redirect:/member/orderlist?memberId="+memberId;
	}

	
}
