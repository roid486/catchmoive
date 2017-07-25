<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="resources/eunseok/ticket_main_css/ticket.css?a=2" />
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
	var totalSum;
	var totalNum;
	var movietheater_number = "${movietheater_number }"
	var theater_number = "${theater_number }"
	var running_start = "${running_start }"
	var running_date = "${running_date }"
	var running_number = "${running_number}"
	var movie_number = "${movie_number}"
	var arr = [];

	jq1(function($) {
		$("#btn1").click(function() {
			//seat table seat_row, seat_column, ticket_number, t_number,mt_number, running_number
			//ticket ticket_peoplenum, m_number,_mt_number,t_number, c_id, r_number

			$.ajax({
				url : "ticketingok.com",
				dataType : "json",
				type : "GET",
				data : {
					m_number : movie_number,
					mt_number : movietheater_number,
					r_number : running_number,
					t_number : theater_number,

				},
				success : function(data) {

				}

			})
			$.fancybox.close();

		});
		$("#btn2").click(function() {

			history.back();
		});

	})
	jq3(function($) {

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
					name : "chk",
					value : item.seat_row + item.seat_column
				})
				var label = $("<label/>").attr("for",
						item.seat_row + item.seat_column)
						.html(item.seat_column);

				$(label).hover(function() {
					if(totalNum > 0){	
					$(this).css({
							cursor : "pointer",
							"background-color" : "#F8FC0B",
						})
						if ($(this).text() <= 4 && totalNum >= 2) {
							$(this).parent().next().find("label").css({
								cursor : "pointer",
								"background-color" : "#F8FC0B"
							})
						} else if($(this).text() >= 5 && totalNum >= 2){
							$(this).parent().prev().find("label").css({
								cursor : "pointer",
								"background-color" : "#F8FC0B"
							})
						}
				}else{
					alert("관람할 인원을 선택해주세요")
				}
				}, function() {
					if (totalNum > 0) {
					$(this).css({
						cursor : "pointer",
						"background-color" : "#ffffff"
					})
					if ($(this).text() <= 4 && totalNum >= 2) {
						$(this).parent().next().find("label").css({
							cursor : "pointer",
							"background-color" : "#ffffff"
						})
						
					} else if($(this).text() >= 5 && totalNum >= 2){
						$(this).parent().prev().find("label").css({
							cursor : "pointer",
							"background-color" : "#ffffff"
						})
					}
					}
				}).click(
						function() {
							
							var one = $(this).parent().find(
									"input[type=checkbox]");
							var two = $(this).parent().next().find(
									"input[type=checkbox]");
							if(two.is(":checked")){
							two.prop("checked",false)
							arr.pop(one.attr("id"))
							arr.pop(two.attr("id"))
							alert("arr :" + arr+"length"+arr.length)
							
							}
							else{
							two.attr("checked",true)
							arr.push(one.attr("id"))
							arr.push(two.attr("id"))
							alert("arr :" +arr+"length"+arr.length)
							totalNum-=2;
							}
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

		$("label").click(function() {
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
			

		})

	});
</script>
<title>Insert title here</title>
</head>
<body>


	<center>
		<table class="table" border="1" width="80%" height="100%">
			<tr height="30%">
				<td colspan="2" width="45%"><div id="radio">
						<span class="title"><b>일반&nbsp&nbsp&nbsp</b></span>
						<div id="adult">
							<c:forEach begin="0" end="5" step="1" varStatus="status">
								<c:choose>
									<c:when test="${status.index ==0}">
										<input type='radio' name='ardo' value='${status.index }'
											id='a${status.index }' checked="checked">
										<label for='a${status.index }'>${status.index }</label>
									</c:when>
									<c:otherwise>
										<input type='radio' name='ardo' value='${status.index }'
											id='a${status.index }'>
										<label for='a${status.index }'>${status.index }</label>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<br> <span class="title"><b>청소년</b></span>
						<div id="youth">
							<c:forEach begin="0" end="5" step="1" varStatus="status">
								<c:choose>
									<c:when test="${status.index ==0}">
										<input type='radio' name='yrdo' value='${status.index }'
											id='y${status.index }' checked="checked">
										<label for='y${status.index }'>${status.index }</label>
									</c:when>
									<c:otherwise>
										<input type='radio' name='yrdo' value='${status.index }'
											id='y${status.index }'>
										<label for='y${status.index }'>${status.index }</label>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<br> <span class="title"><b>우대&nbsp&nbsp&nbsp</b></span>
						<div id="special">
							<c:forEach begin="0" end="5" step="1" varStatus="status">
								<c:choose>
									<c:when test="${status.index ==0}">
										<input type='radio' name='srdo' value='${status.index }'
											id='s${status.index }' checked="checked">
										<label for='s${status.index }'>${status.index }</label>
									</c:when>
									<c:otherwise>
										<input type='radio' name='srdo' value='${status.index }'
											id='s${status.index }'>
										<label for='s${status.index }'>${status.index }</label>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div></td>
				<td colspan="3" width="*">${movietheater_name }
					${theater_number }관 ${running_start } ${running_date }</td>
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
				<td><button id="btn2">뒤로가기</button></td>
				<td></td>
				<td>${movietheater_name }${theater_number }관${running_start }
					${running_date }</td>
				<td></td>
				<td><button id="btn1">예매하기</button></td>
			</tr>
		</table>
	</center>
</body>
</html>