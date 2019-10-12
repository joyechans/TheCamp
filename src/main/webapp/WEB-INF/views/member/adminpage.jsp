<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관리자 페이지</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<jsp:include page="../include/cssimport.jsp" />
</head>
<body class="animsition">

	<!-- Header -->
	<jsp:include page="../include/header.jsp" />
	
	<!-- content page -->		
	<div class ="mypage_block01_wrap">
		<div class="mypage_block01">
			<img src="/resources/images/person.png" style="width: 50px; height: 50px">&nbsp;
			<span style="color:blue;">${ loginuser.memberId }</span> 관리자님!<br>
			<span style="font-size: 16px; font-weight: normal; color:gray;">이 곳은 더 캠프 관리자 페이지입니다</span>
		</div>
	</div>

	<!-- 마이페이지 카테고리 -->
	<div class="mypage">
		<ul> 
			<li style="text-align: center">
				<a href="/member/memberlist" class="p-r-17"> 
					<img src="/resources/images/admin1.png" style="width: 360px; height:360px">
				</a>
				<a href="/member/qalist" class="p-r-17">
					<img src="/resources/images/admin2.png" style="width: 360px; height:360px">
				</a>
				<a href="/member/reporting">
					<img src="/resources/images/admin3.png" style="width: 360px; height:360px">
				</a>								
			</li>
		</ul>
	</div>
	<br><br><br>

	<!-- Footer -->
	<jsp:include page="../include/footer" />
	
	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>


	<!-- js import -->
	<jsp:include page="../include/jsimport.jsp" />

</body>
</html>
