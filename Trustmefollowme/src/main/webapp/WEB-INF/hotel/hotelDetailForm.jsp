<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>FAT roomDetailPage</title>
	<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@400;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/global-header.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/global-footer.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/rooms-and-suites.css">
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/img/favicon.webp" type="image/x-icon">
</head>
<body>
 
    <main>
        <div class="container">

            <!-- Top Text -->
            <div class="page-header-container">
                <h2 class="page-header">${hotel.name}</h2>
                <hr/>
                <p class="page-sub-header">
                   ${hotel.hcontent }
                </p>
            </div>

            <!-- Special offers section -->
            <section class="special-offers">
                <div class="row center-lg">
                    <div class="col image-col right-marg">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image2}" alt="room-image" class="small-image" width="180" height="200">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image3}" alt="room-image" class="small-image" width="180" height="200">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image4}" alt="room-image" class="small-image" width="180" height="200">
                        <div class="side-by-side-container">
                            <div class="large-image-container">
                                <img src="<%=request.getContextPath()%>/resources/images/${hotel.image}" alt="room-image-large" class="large-image" width="370" height="300">
                            </div>
                            <section class="stacked-image-container">
                              <div><img src="<%=request.getContextPath()%>/resources/images/${hotel.image5}" alt="room-image" class="small-image" width="180" height="200"></div>
                              <div><img src="<%=request.getContextPath()%>/resources/images/${hotel.image6}" alt="room-image" class="small-image" width="180" height="200"></div>
                            </section>
                        </div>
                    </div>
                    <div class="col">
                        <h3 class="offers-title">${hotel.name}</h3>
                        <p class="offers-sub-title">
                            ${hotel.address }
                        </p>
                        <ul class="offers-list">
                            <li>
                                <div>
                                    <img src="<%=request.getContextPath()%>/resources/images/check-square.svg" alt="tick" class="list-icon">
                                    <p class="list-text">tel :${hotel.htel}</p>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <img src="<%=request.getContextPath()%>/resources/images/check-square.svg" alt="tick" class="list-icon">
                                    <p class="list-text">${hotel.facility}</p>
                                </div>
                            </li>
                        </ul>
                   <!--      <a href="#" class="btn btn-fill btn-large">Cart</a> -->
                    </div>
                </div>
            </section>

            <!-- Rooms -->
            <section class="rooms-section">
               <div class="page-header-container">
                <h2 class="page-header">Rooms</h2>
                <hr/>
                </div>
                <div class="row center-lg">
                    <div class="rooms col col-2">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image2}"
                            alt="" class="rooms-img" width="450px" height="250px">
                        <h3 class="room-title">${hotel.rname1 }</h3>

                        <br>
                        <p class="amount-text">￦${hotel.rprice1 }</p>
                        
                        <div class="buttons-container">
                            <!-- <a href="#" class="btn btn-ghost">View More</a>
                            <a href="https://timbu.com/search?query=hotel" class="btn btn-fill">Book Now</a> -->
                        </div>
                    </div>
                    <div class="rooms col col-2">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image3}"
                            alt="" class="rooms-img" width="450px" height="250px">
                        <h3 class="room-title">${hotel.rname2 }</h3>
                        <br>
                        <p class="amount-text">￦${hotel.rprice2 }</p>
                        <div class="buttons-container">
                        </div>
                    </div>
                    <div class="rooms col col-2">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image4}"
                            alt="" class="rooms-img" width="450px" height="250px">
                        <h3 class="room-title">${hotel.rname3 }</h3>
                       <!--  <p class="room-text">Designed specifically for Practicality and <br> comfort</p> -->
                        <br>
                        <p class="amount-text">￦${hotel.rprice3 }</p>
                        <div class="buttons-container">
                           <!--  <a href="#" class="btn btn-ghost">View More</a>
                            <a href="https://timbu.com/search?query=hotel" class="btn btn-fill">Book Now</a> -->
                        </div>
                    </div>
                    <div class="rooms col col-2">
                        <img src="<%=request.getContextPath()%>/resources/images/${hotel.image5}"
                            alt="" class="rooms-img" width="450px" height="250px">
                        <h3 class="room-title">${hotel.rname4 }</h3>
                        <!-- <p class="room-text">Designed specifically for Practicality and <br> comfort</p> -->
                        <br>
                        <p class="amount-text">￦${hotel.rprice4 }</p>
                        <div class="buttons-container">
                           <!--  <a href="#" class="btn btn-ghost">View More</a>
                            <a href="https://timbu.com/search?query=hotel" class="btn btn-fill">Book Now</a> -->
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </main>
   <script src="<%=request.getContextPath()%>/resources/js/switchRooms.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/toggleHamburger.js"></script>
</body>

</html>