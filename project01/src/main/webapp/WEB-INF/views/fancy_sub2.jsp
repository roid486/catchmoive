<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="resources/eunseok/ticket_main_css/ticket.css" />
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
	var t1="";
	var t2="";
	var t3="";
	
	jq1(function($) {
		$("#btn1").click(function() {
			
			var str ="";
			for(i=0;i<arr.length;i++)
				{
				str += arr[i]+",";
				}
			$.ajax({
				url : "ticketingok.com",
				dataType : "text",
				type : "GET",
				data : {
					m_number : movie_number,
					mt_number : movietheater_number,
					r_number : running_number,
					t_number : theater_number,
					ticket_price : totalSum,
					str : str
				},
				success : function(data) {
					if(data=="ok")
						{
						alert("성공적으로 예매 되었습니다.")
						}else{
							alert("예매 실패 다시 예매해주세요")
						}
					parent.jq1.fancybox.close();
				}

			})
		});
		$("#btn2").click(function() {

			history.back();
		});
	})
	jq3(function($) {
		var anum = 0;
		var ynum = 0;
		var snum = 0;
		var flag = 0;
		$.getJSON("theaterseat.com", function(data) {
			var divrow;
			$.each(data, function(index, item) {
				if ((index + 1) % 5 == 1) {
					divrow = $("<div></div>").attr("id", "row").append(
							"<span id='label'>" + item.s_row + "</span>")
				}
				var divcol = $("<div></div>").attr({
					id: "col"
				})
				var input = $("<input></input>").attr({
					type : 'checkbox',
					id : item.s_row + item.s_column,
					name : "chk",
					value : item.s_row + item.s_column
				})
				var label = $("<label/>").attr("for",
						item.s_row + item.s_column).css("text-align","center")
						.html("<span id=es>"+item.s_column+"</span>"); 

				if(item.s_ft=='y')
					{
					input.attr({
						checked:true,
						disabled:"disabled"
					});
					}
				
				if(item.s_ft=='n'){
					flag=flag+1;
					
				 $(label).hover(function() {
					if(totalNum > 0){	
					$(this).css({
						cursor : "pointer",
							"background-color" : "#C9C9C9",
						})
						if ($(this).text() <= 4 && totalNum >= 2) {
							$(this).parent().next().find("label").css({
								cursor : "pointer",
								"background-color" : "#C9C9C9"
							})
						} else if($(this).text() >= 5 && totalNum >= 2){
							$(this).parent().prev().find("label").css({
								cursor : "pointer",
								"background-color" : "#C9C9C9"
							})
						}
				}else{
					  alert("관람할 인원을 선택해주세요")  
				}
				}, function() {
					if (totalNum > 0) {
					$(this).css({
						cursor : "pointer",
						"background-color" : "#fdfdee"
					})
					if ($(this).text() <= 4 && totalNum >= 2) {
						$(this).parent().next().find("label").css({
							cursor : "pointer",
							"background-color" : "#fdfdee"
						})
						
					} else if($(this).text() >= 5 && totalNum >= 2){
						$(this).parent().prev().find("label").css({
							cursor : "pointer",
							"background-color" : "#fdfdee"
						})
					}
					}
				}).click(
						function() {
							var one = $(this).parent().find(
									"input[type=checkbox]");
							var two;
							$(this).css({
								"background-color" : "#fdfdee"
							})
							$(this).parent().next().find("label").css({
								"background-color" : "#fdfdee"
							})
							$(this).parent().prev().find("label").css({
								"background-color" : "#fdfdee"
							})
							
							if($(this).text()<5){
							two = $(this).parent().next().find(
									"input[type=checkbox]");
							}
							else{
								two = $(this).parent().prev().find(
								"input[type=checkbox]");		
							}
							if(totalNum >=2 || totalNum==0){
							if(two.is(":checked")){
							two.prop("checked",false)
							arr.pop(one.attr("id"))
							arr.pop(two.attr("id"))
							totalNum+=2;
							}
							else{
							two.attr("checked",true)
							arr.push(one.attr("id"))
							arr.push(two.attr("id"))
							totalNum-=2;
							}
							}
							else{
								if(one.is(":checked")){
									arr.pop(one.attr("id"))
									totalNum+=1;
									alert("one check")
								}else{
									arr.push(one.attr("id"))
									totalNum-=1;
									alert("one uncheck")
								}
							}
							 
							 $("#nseat").html("")
							 $("#nseat").html(arr)
						}) 
				}
				$(input).appendTo(divcol)
				$(label).appendTo(divcol)
				$(divcol).appendTo(divrow);
				$(divrow).appendTo(".ticket_content");
				if ((index + 1) % 5 == 0) {
					$("<br/>").appendTo(".ticket_content");
				}
			})
				$("#present").html("<b>"+flag+"</b>");

		})
		
		$("#radio label").click(function() {
			var a = $(this).parent().attr("id");
			
			
			if (a == "adult") {
				anum = eval($(this).text())
				t1 = "일반"+anum+"명";
			} else if (a == "youth") {
				ynum = eval($(this).text())
				t2 = "청소년"+ynum+"명";
			} else {
				snum = eval($(this).text())
				t3 = "우대"+snum+"명";
			}
			
			totalSum = anum * 10000 + ynum * 7000 + snum * 5000;//총 가격
			totalNum = anum + ynum + snum;//총 인원
			$("#pnum").html(t1+" "+t2+" "+t3);
		})
		$("#btn3").click(function(){
			
			if(("input[type='checkbox']").is(":disabled"))
				{
				alert("ok");
				}
			/* $("input[type=checkbox]").prop("checked",false)
			 */
			$("input[type=radio]:input[value=0]").prop("checked",true)
			anum = 0;
			ynum = 0;  
			snum = 0;
			totalNum = 0; 
			totalSum = 0;
			arr = [];
			$("#pnum").html("");
			$("#nseat").html("");
			
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
					</div>
					<div style="margin-top: 5px; margin-left: 15px;">
						<center>
							<b>※요금표※</b>
						</center>
						일반 : 10000원 청소년 : 7000원 우대 : 5000원</td>
				</div>
				<td colspan="3" width="*"
					style="font-family: Arial, sans-serif; font-weight: bold; font-size: 18px;">
					<div style="margin-left: 55px;">
						${movietheater_name } ${theater_number }관 | 남은 좌석: <span
							id="present" style="color: red;"></span>/${seat_num }<br>
						<h3>${running_date }${running_start }</h3>
				</td>
				</div>
			</tr>
			<tr rowspan="2" height="35%">
				<td colspan="5">
					<center>
						<div class="screen">
							<span>SCREEN</span>
						</div>
						<div class="ticket_content"></div>
						<button id="btn3">reset</button>
					</center>
				</td>
			</tr>
			<tr height="18%">
				<td colspan="5" style="background-color: black;">
					<div id="big">
						<div id="small1">
							<center>
								<a href="#" class="button" id="btn2">영화<br>선택
								</a>
							</center>
						</div>
						<div id="small2">
<<<<<<< HEAD
							영화 포스터/영화이름 <br> <font style="color: white;">${movie_name }</font>
=======
							<span><img width='80px' height='100px' src="resources/upload/${movie_image1 }"></span><br>
							<font style="color: white;">${movie_name }</font>
>>>>>>> branch 'master' of https://github.com/roid486/catchmoive.git
						</div>
						<div id="small3">
							극장<br> <font style="color: white;">${movietheater_name }</font><br>
							상영관<br> <font style="color: white;">${theater_number }관</font>
							<br> 일시<br> <font style="color: white;">${running_date }
								${running_start }</font><br>
						</div>
						<div id="small4">
							인원<br> <span id='pnum' style="color: white;"></span><br>좌석
							번호 <br> <span id="nseat" style="color: white;"></span>
						</div>
						<div id="small5">
							<center>
								<a href="#" class="button" id="btn1">예매<br>하기
								</a>
							</center>
						</div>
					</div>

				</td>
			</tr>
		</table>
	</center>
</body>
</html>