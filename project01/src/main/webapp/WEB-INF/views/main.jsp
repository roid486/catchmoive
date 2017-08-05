<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캐치무비에 오신것을 환영합니다.</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="font.css" type="text/css" rel="stylesheet">
<style type="text/css">
@font-face { 
	font-family: 'NanumGothic'; 
	src: url('font/NanumGothicCoding.ttf').format('truetype'); 
	}



#menu {
	position: relative;
	z-index: 999;
}
<<<<<<< HEAD

#center {
	position: relative;
	display: inline-block;
	width: 100%;
}

#mslist {
	width: 50%;
	height: 400px;
	display: inline-block;
=======
#mslist{
font-family: NanumGothic;
display: inline-block;
		position: absolute;
		left: 0px;
		display: inline-block;
		width: 20%;
		height: 400px;
		cursor: pointer;
>>>>>>> branch 'master' of https://github.com/roid486/catchmoive.git
}
<<<<<<< HEAD

#msimg_outter {
	width: 900px;
	height: 400px;
=======
#msimg_outter{
	margin-left: 25%;
	width: 900px; height: auto;
>>>>>>> branch 'master' of https://github.com/roid486/catchmoive.git
	display: inline-block;
	overflow: hidden;
}
<<<<<<< HEAD

#msimg_inner {
	width: 9000px;
	height: 400px;
	position: relative;
=======
#msimg_inner{
	width: 9000px; height: auto; position: relative;
>>>>>>> branch 'master' of https://github.com/roid486/catchmoive.git
}
<<<<<<< HEAD

.mimg {
	float: left;
	width: 900px;
	height: 400px;
=======
.mimg{
	float: left; width: 900px; height: 550px;
>>>>>>> branch 'master' of https://github.com/roid486/catchmoive.git
}

#bottom {
<<<<<<< HEAD
	position: relative;
	background-color: brown;
	color: white;
=======
	position: relative;   background-color:  #e6f3ff; color: black;
>>>>>>> branch 'master' of https://github.com/roid486/catchmoive.git
}

.table {
	cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "mslist.com",
			success : function(data) {
				var to;
				var time;
				n = 0;
				function tm() {
					time = setInterval(function () {
						n += -900;
						if(n == -9000)
						{
							n = 0;
						}
						$("#msimg_inner").animate({left:n});
					},2500);
				}
				tm();
				$.each(JSON.parse(data), function(idx, item) {
					tr = $("<tr></tr>");
					td = $("<td></td>");
					td1 = $("<td></td>").html("<strong>"+(idx+1)+". </strong>&nbsp;&nbsp;&nbsp;");
					var grade = item.m_grade;
					
					
					if(grade=="전체 관람가"){
						var grade_img_all = $("<img/>").attr({"src":"resources/images/movie_play_level_all.png","width":"25px","height":"25px"});
						$(td1).append($(grade_img_all)).appendTo(tr);
					}
					if(grade=="12세 관람가"){
						var grade_img_12 = $("<img/>").attr({"src":"resources/images/movie_play_level_12.png","width":"25px","height":"25px"});
						$(td1).append($(grade_img_12)).appendTo(tr);
					}
					if(grade=="15세 관람가"){
						var grade_img_15 = $("<img/>").attr({"src":"resources/images/movie_play_level_15.png","width":"25px","height":"25px"});
						$(td1).append($(grade_img_15)).appendTo(tr);
					
					}
					if(grade=="청소년 관람불가"){
						var grade_img_18 = $("<img/>").attr({"src":"resources/images/movie_play_level_18.png","width":"25px","height":"25px"});
						$(td1).append($(grade_img_18)).appendTo(tr);
					}
					
					
					$(td).text(item.m_name).attr({"idx":idx}).appendTo(tr);
					$(tr).appendTo("#mslsee");
					var img = $("<img/>");
					$(img).attr({"src":"resources/upload/"+item.m_image,"width":"900","height":"auto"}).addClass("mimg").appendTo("#msimg_inner");
					$(td).click(function () {
						var idx2 = $(this).attr("idx")*-900;
						clearInterval(time);
						clearTimeout(to);
						$("#msimg_inner").animate({left:idx2});
						to = setTimeout(function () {
							tm();
						},5000);
					});
				});
			}
		});	
	});
</script>
</head>
<body>
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
		<div id="mslist" class="container" style="width: 23%;">
			<table class="table">
				<thead id="thead">
					<tr> 
						<center><th id="boxm"><h4><strong>BOX OFFICE</strong></h4></th></center>
					</tr>
				</thead>
				<tbody id="mslsee">

				</tbody>
			</table>
		</div>
		<div id="msimg_outter">
			<div id="msimg_inner"></div>
		</div>
	<p></p>
	<p></p>
	<p></p>
	<br>
	<br>
	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
</body>
</html>