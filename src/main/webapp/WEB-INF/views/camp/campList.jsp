<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../include/cssimport.jsp" />	
</head>
<body class="animsition">

<jsp:include page="../include/header.jsp" />

	<!-- Title Page -->
	<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m" style="background-image: url(/resources/images/main2.png);">
		<h2 class="l-text1 t-center" style="color:#6fc583d1">
			Camp
		</h2>
	</section>


	<!-- Content page -->
	<section class="bgwhite p-t-55 p-b-65">
		<div class="containers">
			<div class="row">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
					<div class="leftbar p-r-20 p-r-0-sm text-center">
						<!-- 카테고리 -->
						<h4 class="m-text14 p-b-7 text-center">
							Category
						</h4>
						<form name="selectform" method="GET" action="campList">
						<ul class="p-b-54">
							<li class="p-t-4">
							<input type="radio" class="s-text20 active1 radio-btn" name="category" value="all" id="all"<c:if test="${param.category eq 'all'}"></c:if>/><label for="all">전체</label>
								<!-- <button class="s-text13 active1" id="All" data-category="all">All</button> -->
							</li>

							<li class="p-t-4">
							<input type="radio" class="s-text20 active1 radio-btn" name="category" value="숙소" id="room" <c:if test="${param.category eq 'room'}"></c:if>/><label for="room">숙소</label>
								<!-- <button class="s-text13 active1" id="Room" data-category="tent">텐트</button> -->
								
							</li>

							<li class="p-t-4">
							<input type="radio" class="s-text20 active1 radio-btn" name="category" value="카라반" id="caravan" <c:if test="${param.category eq 'caravan'}"></c:if>/><label for="caravan">카라반</label>
								<!-- <button class="s-text13 active1" id="Cravan" data-category="caravan">카라반</button> -->
								
							</li>

							<li class="p-t-4">
							<input type="radio" class="s-text20 active1 radio-btn" name="category" value="글램핑" id="glamping" <c:if test="${param.category eq 'glamping'}"></c:if>/><label for="glamping">글램핑</label>
								<!-- <button class="s-text13 active1" id="Glamping" data-category="glamping">글램핑</button> -->
								
							</li>
						</ul>
						</form>

						<div style="padding-left: 52px">	
							<c:if test="${ loginuser.type eq 'admin' }">							
							<a class="flex-c-m size2 bg1 bo-rad-20 hov1 m-text3 trans-0-4" href="/camp/campWrite">등록하기</a>
							</c:if>
						</div>						

					</div>
				</div>

				<div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
					<div class="flex-sb-m flex-w p-b-35">
						<div class="flex-w"></div>
						<span class="s-text8 p-t-5 p-b-5"></span>
					</div>

					<!-- Product -->
					<div class="row">
					
					<c:forEach var="camp" items="${camps}">
						<div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
							<!-- Block2 -->
							<div class="block2 lists bo4">
								<div class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
									<a href="/camp/campDetail/${camp.campNo}">
										<img src="/resources/camp-files/${ camp.file.savedFileName }" alt="IMG-PRODUCT" style="width: 450px; height: 300px">
									</a>								
								</div>

								<div class="block2-txt p-t-20">
									<a href="/camp/campDetail/${ camp.campNo }" class="block2-name dis-block s-text3 p-b-5">
										<span style="font-size:25px;font-weight:bolder; color:#565656">${ camp.campName }</span>
										
									</a>
								
								<div class="block2-price m-text6 p-r-5">				
										<span style="font-size:23px;font-weight:bolder; color:#c0c0c0">${ camp.category }</span>
								</div>
									<span class="block2-price m-text6 p-r-5" style="font-size:19px;font-weight:bolder; color:#d20054">
									<fmt:formatNumber value="${ camp.price }" pattern="#,###" />원
									</span><br>
								</div>
							</div>
						</div>
					</c:forEach>
			
					</div>

					<!-- Pagination -->
					<div class="pagination flex-m flex-w p-t-26">
							
						    <c:if test="${ pageMaker.prev }">					  
						        <a href='/camp/campList?page=${pageMaker.startPage-1 }&category=${category}'><i class="fa fa-chevron-left"></i></a>						    
						    </c:if>
						    
						    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
						     
						        <a href='/camp/campList?category=${category}&page=${idx }' class="item-pagination flex-c-m trans-0-4"><i class="fa">${idx }</i></a>
						        						  
						    </c:forEach>
						    
						    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">			    
						        <a href='camp/campList?page=${pageMaker.endPage+1 }&category=${category}'  class="item-pagination flex-c-m trans-0-4"><i class="fa fa-chevron-right"></i></a>					    
						    </c:if>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="../include/footer.jsp" />

	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>

	<jsp:include page="../include/jsimport2.jsp" />
	<script type="text/javascript">	 
	$(function(){  			
		$('#all').on('change', function(event){
			this.form.submit();		 			
		 });
		$('#room').on('change', function(event){
			this.form.submit();
		});
		$('#caravan').on('change', function(event){
			this.form.submit();
		});
		$('#glamping').on('change', function(event){
			this.form.submit();
		});  		 			
	});		
	</script>

</body>
</html>
