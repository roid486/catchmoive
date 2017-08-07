<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="mts" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
<<<<<<< HEAD
div {
	border: 1 solid black;
}

#menu {
	position: relative;
	z-index: 999;
}

#mside {
	position: absolute;
	left: 0px;
	display: inline-block;
	width: 20%;
	height: 100%;
}

.mt_num {
	cursor: pointer;
}

#movietheaterdetail {
	position: relative;
	z-index: 1;
	display: inline-block;
	width: 60%;
}

#theaterl {
	width: 100%;
}

#rlist {
	width: 100%;
}

#map {
	height: 400px;
	width: 100%;
}

#bottom {
	position: relative;
	background-color: brown;
	color: white;
}
=======
	#menu {
		position: relative;
		z-index: 999;
	}
	#mside{
		position: absolute;
		left: 0px;
		display: inline-block;
		width: 20%;
		height: 100%;
	}
	.mt_num{
		cursor: pointer;
	}
	#movietheaterdetail{
		position: relative;
		z-index: 1;
		display: inline-block;
		width: 60%;
	}
	#theaterl{
		width: 100%;
	}
	#rlist{
		width: 100%;
	}
	#map {
        height: 400px;
        width: 100%;
	}
	#bottom {
		position: relative;   background-color:  #e6f3ff; color: black;
	}
>>>>>>> branch 'master' of https://github.com/roid486/catchmoive.git
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function () {
		$(".mt_num").click(function () {
			var idx = $(this).attr("idx");
			location.href="movietheater.com?mt_number="+idx;
		});
		$(".tlist").click(function () {
			$("#runningsee").empty();
			var tnum = $(this).val();
			
			$.ajax({
				url : "runninglist.com",
				data:{
					t_number:tnum
				},
				success : function(data) {
					$.each(JSON.parse(data), function(idx, item) {
						tr = $("<tr></tr>");
						td1 = $("<td></td>");
						td2 = $("<td></td>");
						td3 = $("<td></td>");
						$(td1).text(item.m_name).appendTo(tr);
						$(td2).html(item.r_date).appendTo(tr);
						$(td2).html(item.r_date).appendTo(tr);
						$(td3).text(item.r_start).appendTo(tr);
						$(tr).appendTo("#runningsee");
					});
				}
			});	
			
		});
	});
	function initMap() {
		var x = $("#x").val();
		var y = $("#y").val();
        var uluru = {lat: eval(x), lng: eval(y)};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBlyKo_MxZ5m_V2bCiLzBrLzY-qQjy0g40&callback=initMap">
</script>
</head>
<body>
	<input type="hidden" id="re" value="${re }">
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>

	<div id="mside" class="container">
		<table class="table">
			<thead>
				<tr>
					<th>영화관 메뉴</th>
				</tr>
			</thead>
			<tbody>
				<mts:forEach var="mtsd" items="${mtl }">
					<tr id="customer">
						<td><label class="mt_num" idx="${mtsd.mt_number }">${mtsd.mt_name }</label></td>
					</tr>
				</mts:forEach>
			</tbody>
		</table>
	</div>
	<center>
		<div class="container" id="movietheaterdetail">
			<input type="hidden" id="x" value="${mtd.mt_x }"> <input
				type="hidden" id="y" value="${mtd.mt_y }">
			<h2>${mtd.mt_name }</h2>
			<img src="resources/mt_img/${mtd.mt_img }" class="img-rounded"
				alt="Cinque Terre" width="100%" height="200"><br>

			<div class="container" id="theaterl">
				<h2>${mtd.mt_name }상영관</h2>
				<div class="btn-group btn-group-justified">
					<mts:forEach var="tl" items="${theaterlist }">
						<div class="btn-group">
							<button type="button" class="btn btn-primary tlist"
								value="${tl.t_number }">${tl.t_name }</button>
						</div>
					</mts:forEach>
				</div>
			</div>

			<div id="runninglist">
				<div id="rlist" class="container">
					<table class="table">
						<thead>
							<tr>
								<th>영화제목</th>
								<th>상영날짜</th>
								<th>상영시간</th>
							</tr>
						</thead>
						<tbody id="runningsee">

						</tbody>
					</table>
				</div>
			</div>

			<div id="map"></div>
		</div>
<<<<<<< HEAD
	</center>

=======
		</center>
		<p></p>
		<p></p>
		<p></p>
		<br>
		<br>
		<div id="bottom">
			<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
		</div>
>>>>>>> branch 'master' of https://github.com/roid486/catchmoive.git
</body>
</html>