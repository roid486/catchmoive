<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/eunseok/fancybox/jquery.fancybox-1.3.4.css"
	media="screen" />
<link rel="stylesheet" href="resources/eunseok/style.css" />
<link rel="stylesheet"
	href="resources/eunseok/ticket_main_css/ticket_sub.css?a=14323" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	var jq3 = jQuery.noConflict();
</script>
<script type="text/javascript"
	src="resources/eunseok/jquery-migrate-1.4.1.min.js"></script>
<script type="text/javascript">
	var jq1 = jQuery.noConflict();
</script>
<script type="text/javascript"
	src="resources/eunseok/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript"
	src="resources/eunseok/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript">
	jq1(function($) {
		jq1("#btn1").click(function() {
			parent.jq1.fancybox.close();
		});
	})
	jq3(function($) {
		var movie_number;
		var movietheater_number;
		var running_date;
		var running_start;
		var theater_number;
		var running_number;
		var org = "";
		var storethis;
		var storeid="sub1_form";
		var flag = 0;
		var tx;
		$.getJSON("firstList.com", function(data) {
			$.each(data, function(index, item) {
				var a1 = $("<a></a>").attr({
					href : "#",
					id : item.m_number,
					name : "sub1",
					idx : item.m_image
				}).html(item.m_name)
				$("#sub1_form").append(a1, "<br>");
			})
		})
		$(document).on(
				"click",
				"a",
				function() {
					var chk = $(this).attr("name");
			 		
					if (storethis != null) {
						if (storethis != $(this)) {
							storethis.css({
								color : "#03c",
								"font-weight" : "bold"
							});
							
						}
					}
					
					$(this).css({
						color : "red",
						"font-weight" : "bold"
					});
					
					storethis = $(this);
					if (chk == "sub1") {
						movie_number = $(this).attr("id");
						var mname = $(this).text();
						$("#name").html(mname);
						$("#post").html(
								"<img width='80px' height='100px' src='resources/upload/"
										+ $(this).attr("idx") + "'>")
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
				var the = $(this).text();
				$("#the").html(the);
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
				$("#day").html($(this).text())
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
				$("#the1").html(theater_number + "관")
				
				$("#day").html($("#day").text().substring(0,11) + " " +$(this).text())
				tx = $(this).text();
				$.ajax({
					url : "fifthList.com",
					datatype : "json",
					type : "GET",
					data : {
					    mt_number : movietheater_number,
						running_start : running_start,
						running_date : running_date
					},
					success : function(data) {
						running_number = eval(data);
					},
					error : function(data) {
						alert("실패" + data)
					}
				})
			}
		})
		$("#move_sub2")
				.click(
						function() {
							var loginid = $("#loginid").val();
							if(loginid!=null && loginid!="")
							{
								if (movie_number != null
										&& movietheater_number != null
										&& running_date != null
										&& running_start != null
										&& theater_number != null
										&& running_number != null) {
									window.location.href = "fancy_sub2.com?movie_number="
											+ movie_number
											+ "&movietheater_number="
											+ movietheater_number
											+ "&running_date="
											+ running_date
											+ "&running_start="
											+ running_start
											+ "&theater_number="
											+ theater_number
											+ "&running_number=" + running_number;
								} else {
									alert("선택하지 않은 항목이 있습니다.")
								}
							}
							else{
								alert("로그인 하십시오.");
								
							}
						})
	})
</script>
</head>
<body>
	<input type="hidden" id="loginid" value="${se_id }">
	<center>
		<div id="main_form">
			<div id="chk1">
				<div id="sub1_form"></div>
				<div id="sub2_form"></div>
				<div id="sub3_form"></div>
				<div id="sub4_form"></div>
			</div>
			<div id="sub5_form">
				<div id="small1">
					<a href="#" class="button" id="btn1">뒤로가기</a>
				</div>
				<div id="small2">
					<span id='post'></span><br> <span id="name"
						style="color: white;"></span>
				</div>
				<div id="small3">
					극장 <br> <span id="the" style="color: white;"></span><br>상영관<br>
					<span id="the1" style="color: white;"></span> <br> 일시<br>
					<span id="day" style="color: white;"></span>
				</div>
				<div id="small4">
					좌석 번호 <br> <span id="nseat" style="color: white;"></span>
				</div>
				<div id="small5">
					<a href="#" id="move_sub2" class="button">좌석선택</a>
				</div>
			</div>
		</div>
	</center>
</body>
</html>