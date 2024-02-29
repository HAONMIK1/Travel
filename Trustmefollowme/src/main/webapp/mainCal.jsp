<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <head>
  	<title>Calendar 03</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style2.css">

	</head>
	<body>
	    <div class="calendar calendar-first" id="calendar_first">
		              <div class="calendar_header">
		                <button class="switch-month switch-left">
		                  <i class="fa fa-chevron-left"></i>
		                </button>
		                <h2></h2>
		                <button class="switch-month switch-right">
		                  <i class="fa fa-chevron-right"></i>
		                </button>
		              </div>
		              <div class="calendar_weekdays"></div>
		              <div class="calendar_content"></div>
		            </div>

  <script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<input type="text" id="date">	
</body>