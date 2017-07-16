<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="resources/eunseok/ticket_main_css/ticket.css" />
<script>
	!window.jQuery
			&& document
					.write('<script src="resources/eunseok/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript"
	src="resources/eunseok/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript"
	src="resources/eunseok/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/eunseok/fancybox/jquery.fancybox-1.3.4.css"
	media="screen" />
<link rel="stylesheet" href="resources/eunseok/style.css" />
<script type="text/javascript">
	$(function() {

				$("#btn1").click(function() {

					parent.$.fancybox.close();
				});
				$("#btn2").click(function() {

					history.back();
				});

				$.getJSON("theaterseat.com", function(data) {
					alert(data)

				})

				$(".label > a").hover(function() {

					$(this).css("color", "red");
					$(this).next().css("color", "red");
				}, function() {
					$(this).css("color", "blue");
					$(this).next().css("color", "blue");
				}).click(
						function() {
							alert("row :"
									+ $(this).parent().find("span[class=row]")
											.text()
									+ ",col : "
									+ $(this).text()
									+ "\n\r"
									+ "row :"
									+ $(this).next().parent().find(
											"span[class=row]").text()
									+ ",col : " + $(this).next().text());
						});
				$("#adult > a").click(function() {

					alert($(this).text());

				})
			})
</script>
<title>Insert title here</title>
</head>
<body>
	<%-- 	${title }
	<button id="btn1">Close fancyBox</button>
	<button id="btn2">Move fancy_Sub</button> --%>
	<center>
		<table class="table" border="1" width="80%" height="100%">
			<tr height="30%">
				<td colspan="2" width="45%"><span class="title"><b>일반&nbsp&nbsp&nbsp</b></span>
					<div id="adult">
						<a href="#" onclick="return false"><span class="person_no"><div
									class="person_num">1</div></a> <a href="#" onclick="return false"><span
							class="person_no"><div class="person_num">2</div></a> <a
							href="#" onclick="return false"><span class="person_no"><div
									class="person_num">3</div></a> <a href="#" onclick="return false"><span
							class="person_no"><div class="person_num">4</div></a> <a
							href="#" onclick="return false"><span class="person_no"><div
									class="person_num">5</div></a>
					</div> <br> <span class="title"><b>청소년</b></span>
					<div id="youth">
						<a href="#" onclick="return false"><span class="person_no">
								<div class="person_num">1</div></a> <a href="#"
							onclick="return false"><span class="person_no"><div
									class="person_num">2</div></a> <a href="#" onclick="return false"><span
							class="person_no"><div class="person_num">3</div></a> <a
							href="#" onclick="return false"><span class="person_no"><div
									class="person_num">4</div></a> <a href="#" onclick="return false"><span
							class="person_no"><div class="person_num">5</div></a>
					</div> <br> <span class="title"><b>우대&nbsp&nbsp&nbsp</b></span>
					<div id="special">
						<a href="#" onclick="return false"><span class="person_no"><div
									class="person_num">1</div></a> <a href="#" onclick="return false"><span
							class="person_no"><div class="person_num">2</div></a> <a
							href="#" onclick="return false"><span class="person_no"><div
									class="person_num">3</div></a> <a href="#" onclick="return false"><span
							class="person_no"><div class="person_num">4</div></a> <a
							href="#" onclick="return false"><span class="person_no"><div
									class="person_num">5</div></a>
					</div></td>
				<td colspan="3" width="*"></td>
			</tr>
			<tr height="40%">
				<td rowspan="2" colspan="5">
					<center>
						<div class="screen">
							<span>SCREEN</span>
						</div>
						<div class="ticket_content">
							<!-- <div class="label">
								<span class=row>A</span> <a href='#' onclick='return false'><span
									class=seat_no><div class="r">1</div></span></a> <a href='#'
									onclick='return false'><span class=seat_no><div
											class="r">2</div></span></a> <a href='#' onclick='return false'><span
									class=seat_no><div class="r">3</div></span></a> <a href='#'
									onclick='return false'><span class=seat_no><div
											class="r">4</div></span></a>
							</div>
							<div class="label">
								<span class=row>B</span> <a href='#' onclick='return false'><span
									class=seat_no><div class="r">1</div></span></a> <a href='#'
									onclick='return false'><span class=seat_no><div
											class="r">2</div></span></a> <a href='#' onclick='return false'><span
									class=seat_no><div class="r">3</div></span></a> <a href='#'
									onclick='return false'><span class=seat_no><div
											class="r">4</div></span></a>
							</div>
						</div> -->
					</center>
				</td>
			</tr>
			<tr>
			</tr>
			<tr height="30%">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</center>
</body>
</html>