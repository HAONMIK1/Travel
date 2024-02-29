<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="detailBoot.jsp"%>

		
		<div class="container">
	        <div class="heading-section">
	            <h2>${sb.name}</h2>
	        </div>
	        <div class="row">
	        	<div class="col-md-6">
	        		<div id="slider" class="owl-carousel product-slider">
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image2}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image3}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image4}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image5}" width="200px" height="300px">
						</div>
					</div>
					<div>　</div>
					<div id="thumb" class="owl-carousel product-thumb">
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image2}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image3}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image4}" width="200px" height="300px">
						</div>
						<div class="item">
                 <img src="<%=request.getContextPath()%>/resources/images/${sb.image5}" width="200px" height="300px">
						</div>
					</div>
	        	</div>
	        	<div class="col-md-6">
	        		<div class="product-dtl">
        				<div class="product-info">
		        			<div class="reviews-counter">
		        			<p class="product-price-discount">주소: ${sb.address}
		        			<br>
		        			영업시간: ${sb.stime}</p>
		        		</div>
	        			<p>
	        			${sb.content}
	        			</p>
	        		
	        		</div>
	        	</div>
	        </div>
		</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>