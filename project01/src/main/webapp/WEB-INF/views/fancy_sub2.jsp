<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="resources/eunseok/ticket_main_css/ticket.css?a=1" />
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
<link rel="stylesheet" type="text/css"
	href="resources/eunseok/fancybox/jquery.fancybox-1.3.4.css"
	media="screen" />
<link rel="stylesheet" href="resources/eunseok/style.css" />
<script type="text/javascript">
	jq1(function($) {
		$("#btn1").click(function() {

			parent.$.fancybox.close();
		});
		$("#btn2").click(function() {

			history.back();
		});

	})
	jq3(function($) {
		var totalSum;
		var anum = 0;
		var ynum = 0;
		var snum = 0;

		$.getJSON("theaterseat.com", function(data) {
			var divrow;
			$.each(data, function(index, item) {
				if ((index + 1) % 5 == 1) {
					divrow = $("<div></div>").attr("id", "row").append(
							"<span id='label'>" + item.seat_row + "</span>")
				}
				var divcol = $("<div></div>").attr("id", "col");
				var input = $("<input></input>").attr({
					type : 'checkbox',
					id : item.seat_row + item.seat_column,
					name : item.seat_row + item.seat_column,
					value : item.seat_row + item.seat_column
				})
				var label = $("<label/>").attr("for",
						item.seat_row + item.seat_column)
						.html(item.seat_column);

				$(label).hover(function() {
					$(this).css({
						cursor : "pointer",
						"background-color" : "#F8FC0B",
					})
					$(this).parent().next().find("label").css({
						cursor : "pointer",
						"background-color" : "#F8FC0B"
					})
				}, function() {
					$(this).css({
						cursor : "pointer",
						"background-color" : "#ffffff"
					})
					$(this).parent().next().find("label").css({
						cursor : "pointer",
						"background-color" : "#ffffff"
					})

				});

				$(label).click(
						function() {
							var one = $(this).parent().find(
									"input[type=checkbox]").attr("id")
							var two = $(this).parent().next().find(
									"input[type=checkbox]").attr("id")
							alert(one + "//" + two)

						})
				$(input).appendTo(divcol)
				$(label).appendTo(divcol)
				$(divcol).appendTo(divrow);
				$(divrow).appendTo(".ticket_content")
				if ((index + 1) % 5 == 0) {
					$("<br/>").appendTo(".ticket_content")
				}
			})

		})

		$("a").click(function() {
			var a = $(this).parent().attr("id");
			if (a == "adult") {
				anum = eval($(this).text())
			} else if (a == "youth") {
				ynum = eval($(this).text())
			} else {
				snum = eval($(this).text())
			}
			totalSum = anum * 10000 + ynum * 7000 + snum * 5000;//총 가격
			totalNum = anum + ynum + snum;//총 인원
			//alert(totalSum) 총가격
		})

	});
</script>
<title>Insert title here</title>
</head>
<body>
	<%-- 	${title }
	<button id="btn1">Close fancyBox</button>
	<button id="btn2">Move fancy_Sub</button> --%>
	<input type='checkbox' name='a1' id='a1'>
	<center>
		<table class="table" border="1" width="80%" height="100%">
			<tr height="30%">
				<td colspan="2" width="45%"><div id="check">
						<span class="title"><b>일반&nbsp&nbsp&nbsp</b></span>
						<div id="adult">
							<a href="#" onclick="return false"><span class="person_no"><div
										class="person_num">0</div></a> <a href="#" onclick="return false"><span
								class="person_no"><div class="person_num">1</div></a> <a
								href="#" onclick="return false"><span class="person_no"><div
										class="person_num">2</div></a> <a href="#" onclick="return false"><span
								class="person_no"><div class="person_num">3</div></a> <a
								href="#" onclick="return false"><span class="person_no"><div
										class="person_num">4</div></a> <a href="#" onclick="return false"><span
								class="person_no"><div class="person_num">5</div></a>
						</div>
						<br> <span class="title"><b>청소년</b></span>
						<div id="youth">
							<a href="#" onclick="return false"><span class="person_no">
									<div class="person_num">0</div></a> <a href="#"
								onclick="return false"><span class="person_no">
									<div class="person_num">1</div></a> <a href="#"
								onclick="return false"><span class="person_no"><div
										class="person_num">2</div></a> <a href="#" onclick="return false"><span
								class="person_no"><div class="person_num">3</div></a> <a
								href="#" onclick="return false"><span class="person_no"><div
										class="person_num">4</div></a> <a href="#" onclick="return false"><span
								class="person_no"><div class="person_num">5</div></a>
						</div>
						<br> <span class="title"><b>우대&nbsp&nbsp&nbsp</b></span>
						<div id="special">
							<a href="#" onclick="return false"><span class="person_no"><div
										class="person_num">0</div></a> <a href="#" onclick="return false"><span
								class="person_no"><div class="person_num">1</div></a> <a
								href="#" onclick="return false"><span class="person_no"><div
										class="person_num">2</div></a> <a href="#" onclick="return false"><span
								class="person_no"><div class="person_num">3</div></a> <a
								href="#" onclick="return false"><span class="person_no"><div
										class="person_num">4</div></a> <a href="#" onclick="return false"><span
								class="person_no"><div class="person_num">5</div></a>
						</div>
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
									<span class=row>A</span> 
									<a href='#' onclick='return false'>
										<span class=seat_no>
											<div class="r">1</div>
										</span>
									</a> 
								<a href='#'
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
							</div>-->
						</div>
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