<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="side.jsp" />
<header class="header1">
	<!-- Header desktop -->
	<div class="container-menu-header">
		<div class="wrap_header">
			<!-- Logo -->
			<a href="/home" class="logo"> 
				<img src="/resources/images/icons/logo.png" alt="IMG-LOGO"> TheCamp
			</a>

			<!-- Menu -->
			<div class="wrap_menu">
				<nav class="menu">
					<ul class="main_menu">
						<li><a href="/camp/campList?category=all" style="font-size: 17px; font-weight: bolder;">캠핑장 예약</a></li>
						<li><a href="/product/productList?category=all" style="font-size: 17px; font-weight: bolder;">캠핑장 용품</a></li>
						<li><a href="/upload/tourist" style="font-size: 17px; font-weight: bolder;">주변관광지</a></li>
						<li><a href="/qna/qna" style="font-size: 17px; font-weight: bolder;">Q&A</a></li>
					</ul>
				</nav>
			</div>
			
			<!-- Header Icon -->
			<div class="header-icons">
				<div class="header-wrapicon1 dis-block">
					<c:choose>
						<c:when test="${ empty loginuser }">
							<a href="/account/login" style="font-weight: bolder;">로그인</a>&nbsp;&nbsp;
							<a href="/account/register" style="font-weight: bolder;">회원가입</a>
						</c:when>
						<c:otherwise>
							<div>
								<a href="#" onclick="openNav()" class="p-r-8"> 
								<img src="/resources/images/icons/icon-header-01.png" class="header-icon1" alt="ICON"> 
								<span style="color: blue; font-weight: bolder;">${ loginuser.memberId }님</span>환영합니다!
								</a>&nbsp;
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
		</div>
	</div>

	<!-- Header Mobile -->
	<div class="wrap_header_mobile">
		<!-- Logo moblie -->
		<a href="/home" class="logo-mobile"> 
			<img src="/resources/images/icons/logo.png" alt="IMG-LOGO">
		</a>

		<!-- Button show menu -->
		<div class="btn-show-menu">
			<!-- Header Icon mobile -->
			<a href="#" class="header-wrapicon1 dis-block" onclick="openNav()"> 
				<img src="/resources/images/icons/icon-header-01.png" class="header-icon1" alt="ICON">
			</a>

			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</div>
		</div>
	</div>

	<!-- Menu Mobile -->
	<div class="wrap-side-menu">
		<nav class="side-menu">
			<ul class="main-menu">
				<li class="item-menu-mobile"><a href="/camp/campList?category=all">캠핑장 예약</a></li>
				<li class="item-menu-mobile"><a href="/product/productList?category=all">캠핑장 용품</a></li>
				<li class="item-menu-mobile"><a href="/upload/tourist">주변관광지</a></li>
				<li class="item-menu-mobile"><a href="/qna/qna">Q&A</a></li>
			</ul>
		</nav>
	</div>
</header>

<script type="text/javascript">
	/* Set the width of the sidebar to 250px (show it) */
	function openNav() {
		document.getElementById("mySidepanel").style.width = "350px";
	}

	/* Set the width of the sidebar to 0 (hide it) */
	function closeNav() {
		document.getElementById("mySidepanel").style.width = "0";
	}
</script>