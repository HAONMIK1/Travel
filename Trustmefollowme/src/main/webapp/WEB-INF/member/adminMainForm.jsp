<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminHeader.jsp"%>
<%@include file="../common/common.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css' rel='stylesheet' />
<style>
#date {
	font-size: 40px;
	width: 100%;
	display: flex;
	justify-content: center;
	margin: 20px 0;
}

.main--container {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	position: relative;
}

.content--container {
	display: flex;
	width: 100%;
	justify-content: center;
	background-color: #FBFBFC;
}

.event--box {
	display: flex;
	flex-direction: column;
	height: 100%;
	margin-top: 5px;
}

#event--box {
	width: 400px;
	height: 200px;
}

#event--box:hover {
	cursor: pointer;
}
#title--box {
	margin: 3px;
}

.content--box {
	background-color: #fff;
	margin: 10px;
	padding: 10px;
	opacity: 0.9;
}

#question--box {
	height: 100px;
	margin-top: 20px;
}

#revenue {
	width: 700px;
	min-width: 700px;
	margin-top: 40px;
}

#reserve {
	width: 700px;
	min-width: 700px;
	height: 500px;
}

#join {
	margin-top: 20px;
}

.question--count {
	font-size: 20px;
	margin-top: 15px;
}

#question--count a:hover {
	text-decoration: none;
}

.dining, .fac, .room {
	display: flex;
	justify-content: space-between;
}

.check--box {
	color: black;
}

.check--box:hover {
	text-decoration: none;
	color: black;
}

.ok {
	color: #3366FF;
}

.no {
	color: #FF3E30;
}

.date--box {
	height: 500px;
}

a:hover {
	text-decoration: none;
}

.main--container::after {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	opacity: 0.4;
	z-index: -1;
}

.fc-title{
	color: #4A4B4B;
}
.event-3 {
	background-color: gray;
}
</style>
<div class="main--container">
	<div id="date"></div>
	<div class="content--container" align="center">
		<div class="left--content">
			<div class="content--box" id="reserve">
				<b class="title--box"><!-- 예약 --></b>
				<div id="calendar"></div>
			</div>
			<div class="content--box" id="revenue">
				<b class="title--box"><!-- 매출 --></b>
				<div id="revenue--chart"></div>
			</div>
		</div>
 		<div class="center--content">
			<div class="content--box" id="event--box" onclick="location.href='/event/notice'">
				<b class="title--box">이벤트</b>
				<div class="event--box">
					<c:forEach items="${event}" var="list">
						<div id="title--box">${list.startDate}&nbsp;&nbsp;&nbsp;${list.title}</div>
					</c:forEach>
				</div>
			</div>

			<div class="content--box" id="question--box">
				<b class="title--box">문의사항</b>
				<c:choose>
					<c:when test="${question != 0}">
						<span style="color: red; font-weight: bold;">new</span>
						<div class="question--count">
							<a href="/question/questionList">답변을 기다리는 문의가 ${question} 개
								있습니다</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="question--count">답변을 기다리는 문의가 없습니다</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="content--box" id="join">
				<b class="title--box">가입</b>
				<div id="join--chart"></div>
			</div>

			<div class="content--box" id="">
				<b class="title--box">시설 상태 현황</b>
				<div class="room">
					<a href="" class="check--box">객실</a>
					<c:choose>
						<c:when test="${availableRoom == 0}">
							<div>
								<span class="no">사용 불가</span> ${notAvailableRoom}개
							</div>
						</c:when>
						<c:when test="${notAvailableRoom == 0}">
							<div>
								<span class="ok">사용 가능</span> ${availableRoom}개
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<span class="ok">사용 가능</span> ${availableRoom}개 <span class="no">사용
									불가</span> ${notAvailableRoom}개
							</div>
						</c:otherwise>
					</c:choose> 
				</div>

				 <div class="dining">
					<a href="" class="check--box">레스토랑</a>
					<c:choose>
						<c:when test="${restaurant == 0}">
							<div class="no">사용불가</div>
						</c:when>
						<c:otherwise>
							<div class="ok">사용 가능</div>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="dining">
					<a href="" class="check--box">라운지 & 바</a>
					<c:choose>
						<c:when test="${bar == 0}">
							<div class="no">사용불가</div>
						</c:when>
						<c:otherwise>
							<div class="ok">사용 가능</div>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="fac">
					<a href="" class="check--box">수영장</a>
					<c:choose>
						<c:when test="${pool == 0}">
							<div class="no">사용불가</div>
						</c:when>
						<c:otherwise>
							<div class="ok">사용 가능</div>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="fac">
					<a href="" class="check--box">스파</a>
					<c:choose>
						<c:when test="${spa == 0}">
							<div class="no">사용불가</div>
						</c:when>
						<c:otherwise>
							<div class="ok">사용 가능</div>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="fac">
					<a href="" class="check--box">피트니스</a>
					<c:choose>
						<c:when test="${fitness == 0}">
							<div class="no">사용불가</div>
						</c:when>
						<c:otherwise>
							<div class="ok">사용 가능</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div> 
</div>
</main>


<script>
	window.onload = function() {
		let today = new Date();
		let todayDate = document.getElementById('date');
		let year = today.getFullYear();
		let month = today.getMonth() + 1;
		let date = today.getDate();

		document.querySelector('#date').innerHTML = year + "년&nbsp" + month
				+ "월&nbsp" + date + "일"
		//document.write("오늘은" + year + "년" + month + "월" + date + "일 입니다")
	}

	// 매출 차트
	google.charts.load('current', {
		packages : [ 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawingChart);

	function drawingChart() {
		$
				.ajax({
					type : 'GET',
					url : '/api/totalPrice',
					dataType : "json"
				})
				.done(
						function(response) {
							let totalPrice = response;
							console.log(totalPrice);
							console.log(response);
							let data = new google.visualization.DataTable();
							data.addColumn('date', 'Date');
							data.addColumn('number', 'Sales');

							let chartData = [];

							let today = new Date();
							today.setHours(0, 0, 0, 0);

							for (let i = 0; i <= 6; i++) {
								let date = new Date(today);
								date.setDate(date.getDate() - i);

								let revenue = i < totalPrice.length ? totalPrice[totalPrice.length
										- 1 - i]
										: 0;

								chartData.push([ date, revenue ]);
							}

							data.addRows(chartData);

							let options = {
								title : 'Sales by Date',
								hAxis : {
									title : 'Date',
									format : 'yyyy-MM-dd',
								},
								vAxis : {
									title : 'Sales',
								},
								animation : {
									duration : 1000,
									startup : true,
								},
								backgroundColor : {
									fill : '#F6F6F7',
								}
							};

							let chart = new google.visualization.ColumnChart(
									document.getElementById('revenue--chart'));

							chart.draw(data, options);
						}).fail(function(xhr, status, error) {
					console.log('Error:', error);
				});
	}

	// 회원 차트
	google.charts.load('current', {
		packages : [ 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		$.ajax({
			type : 'GET',
			url : '/api/joinCount',
			dataType : "json"
		}).done(
				function(response) {
					console.log(response[0])
					// let memberCount = response.memberCount;
					// let membershipCount = response.membershipCount;
					let memberCount = response[0]
					let membershipCount = response[1]
					/*
					let data = new google.visualization.DataTable();
					data.addColumn('string', 'Category');
					data.addColumn('number', 'Count');
					data.addRows([ [ '회원가입', 0 ], [ '멤버쉽 가입', 0 ] ]);

					data.setValue(0, 1, memberCount);
					data.setValue(1, 1, membershipCount);
					*/
					let options = {
						title : '오늘 회원가입 수와 멤버쉽 가입 수',
						hAxis : {
							title : 'Category',
						},
						vAxis : {
							title : 'Count',
						},
						
						animation : {
							duration : 1000,
							startup : true,
						},
						backgroundColor : {
							fill : '#F6F6F7',
						}
					};
					
					let data = google.visualization.arrayToDataTable([
				         ['Category', 'Count'],
 				         ['회원가입', memberCount],         
				         ['멤버쉽 가입', membershipCount],  
				     ]);
					
					
					let chart = new google.visualization.ColumnChart(document
							.getElementById('join--chart'));

					chart.draw(data, options);
				}).fail(function(xhr, status, error) {
			console.log('Error:', error);
		});
	}
	
	let intialLocaleCode = 'ko';
	// 예약 달력
	 $(document).ready(function() {
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                defaultView: 'month',
                editable: true,
                eventColor: '#D2F2FC',
                events: function(start, end, timezone, callback) {
                    $.ajax({
                        url: '/api/allReserve', 
                        type: 'GET', 
                    }).done(function(response) {
                    	  console.log(response)
                    	  let events = [];
                          for (let i = 0; i < response.length; i++) {
                              let reservation = response[i];
                              if (reservation && reservation.room) {
                              let event = {
                            	  title: reservation.user.name,
                                  start: reservation.startDate,
                                  end: reservation.endDate,
                                  className: reservation.room.id ? 'event-' + reservation.room.id : 'event-dining-id'
                              };
                            	  
                              events.push(event);
                              }
                          }
                        callback(events); 
                    }).fail(function(xhr, status, error) {
                    	console.log('Error:', error);
                    });
                },
                    eventRender: function(event, element) {
						 element.find('.fc-title').html(event.name);
						 element.addClass(event.className);
                 }
            });
        });
</script>