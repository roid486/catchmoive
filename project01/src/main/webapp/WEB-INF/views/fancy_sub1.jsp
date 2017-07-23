<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/eunseok/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" href="resources/eunseok/style.css" />
<link rel="stylesheet" href="resources/eunseok/ticket_main_css/ticket_sub.css" />
<style type="text/css">
#sub1_form {
	height: 500px;
	overflow: auto;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
var jq3= jQuery.noConflict();
</script>
<script type="text/javascript" src="resources/eunseok/jquery-migrate-1.4.1.min.js"></script>
<script type="text/javascript">
var jq1= jQuery.noConflict();
</script>
<script type="text/javascript"
	src="resources/eunseok/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript"
	src="resources/eunseok/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript">
	jq1(function($){
		$("#btn1").click(function() {
			alert("o")
			parent.$.fancybox.close();
		});

	})
	
	jq3(function($) {
		var movie_number;
		var movietheater_number;
		var running_date;
		var running_start;
		var theater_number;
		
		$.getJSON("firstList.com", function(data) {
			$.each(data, function(index, item) {
				var a1 = $("<a></a>").attr({
					href : "#",
					id : item.m_number,
					name : "sub1"
				}).html(item.m_name)

				$("#sub1_form").append(a1, "<br>");
			})
		})

		$(document).on("click", " a", function() {
			var chk = $(this).attr("name");
			if (chk == "sub1") {
				movie_number = $(this).attr("id");
				$("#sub2_form").empty();
				$.ajax({
					url : "secondList.com",
					dataType : "json",
					type : "GET",
					data : {
						movie_number : movie_number
					},
					success : function(data1) {
						$.each(data1, function(index, item) {
							var a2 = $("<a></a>").attr({
								href : "#",
								id : item.mt_number,
								name : "sub2"
							}).html(item.mt_name)
							$("#sub2_form").append(a2, "<br>");
						})
					}
				})
			}
		})

		$(document).on("click", " a", function() {
			var chk = $(this).attr("name");
			if (chk == "sub2") {
			movietheater_number = $(this).attr("id");
				$("#sub3_form").empty();
				$.ajax({
					url : "thirdList.com",
					dataType : "json",
					type : "GET",
					data : {
						movie_number : movie_number,
						movietheater_number : movietheater_number
					},
					success : function(data2) {
						$.each(data2, function(index, item) {
							var a3 = $("<a></a>").attr({
								href : "#",
								id : item.r_date,
								name : "sub3"
							}).html(item.r_date)
							$("#sub3_form").append(a3, "<br>");
						})
					}
				})
			}
		})

		$(document).on("click", " a", function() {
			var chk = $(this).attr("name");
			if (chk == "sub3") {
			running_date = $(this).attr("id");
				$("#sub4_form").empty();
				$.ajax({
					url : "fourthList.com",
					dataType : "json",
					type : "GET",
					data : {
						movie_number : movie_number,
						movietheater_number : movietheater_number,
						running_date : running_date
					},
					success : function(data3) {
						$.each(data3, function(index, item) {
							var a4 = $("<a></a>").attr({
								href : "#",
								id : item.r_start,
								name : "sub4"
							}).html(item.r_start)
							$("#sub4_form").append(a4, "<br>");
							theater_number = item.t_number;
						})
					}
				})
			}
		})
		
		$(document).on("click", " a", function() {
			var chk = $(this).attr("name");
			if (chk == "sub4") {
			running_start = $(this).attr("id");
			}
		})
		
		$("#move_sub2").click(function(){

			window.location.href="fancy_sub2.com?movie_number="+movie_number+"&movietheater_number="+movietheater_number+"&running_date="+running_date+"&running_start="+running_start+"&theater_number="+theater_number;
			
		})
	})
</script>
</head>
<body>
	${title }
	<button id="btn1">Close fancyBox</button>
	
	<a id="move_sub2" href="#">Move fanct_sub2</a>
	<center>
		<div id="main_form">
			<div id="sub1_form"></div>
			<div id="sub2_form"></div>
			<div id="sub3_form"></div>
			<div id="sub4_form"></div>
		</div>
	</center>
</body>
</html>