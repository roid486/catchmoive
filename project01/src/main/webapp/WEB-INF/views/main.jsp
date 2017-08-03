<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
#menu {
	position: relative;
	z-index: 999;
}
#center {
	position: relative;
	display: inline-block;
	width: 100%;
}

#mslist{
width:50%;
height: 400px;
display: inline-block;
}
#msimg_outter{
	width: 900px; height: 400px;
	display: inline-block;
	overflow: hidden;
}
#msimg_inner{
	width: 9000px; height: 400px; position: relative;
}
.mimg{
	float: left; width: 900px; height: 400px;
}
#bottom {
	position: relative; background-color: brown; color: white;
}
.table{
	cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		var arr;
		var arr2;
		var arr3;
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
					$(td).text(item.m_name).attr({"colspan":"2","idx":idx}).appendTo(tr);
					$(tr).appendTo("#mslsee");
					var img = $("<img/>");
					$(img).attr({"src":"resources/upload/"+item.m_image,"width":"900","height":"400"}).addClass("mimg").appendTo("#msimg_inner");
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
	<div id="center">
		<div id="mslist" class="container" style="width: 25%;">
			<table class="table">
				<thead>
					<tr>
						<th id="scorem">평점 순위</th>
						<th id="boxm">예매율 순위</th>
					</tr>
				</thead>
				<tbody id="mslsee">

				</tbody>
			</table>
		</div>
		<div id="msimg_outter">
			<div id="msimg_inner">
			
			</div>
		</div>
	</div>
	<br>
	<br>
	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
</body>
</html>