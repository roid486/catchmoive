<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
td{
width:45px;
}
#weather_ha{
font-size: 10px;
text-align: center;
}
table{
border: 1px solid black;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
	var flag = 0;
	var flag1 = 0;
		$.ajax({
			url : "weather.jsp",
			dataType : "json",
			type : "GET",
			// 		data : {
			// 			movie_number : movie_number
			// 		},
			success : function(data) {
				var data1 = data.weather.forecast3days[0].fcst3hour.sky;
				var data2 = data.weather.forecast3days[0].fcst3hour.temperature;
				
				$.each(data1, function(idx, item) {
					if(flag < 14){
						time = idx.substring(idx.indexOf("e")+1,idx.indexOf("h"))
						if(!item.indexOf("S")){

							$("<td></td>").html(time+":00").appendTo("#weather_ti")
							$("<td></td>").html("<img width='30px' height='30px' src='resources/eunseok/weather_icons/"+item+".png'>").appendTo("#weather_em")
						}
						else{
							$("<td></td>").html(item).appendTo("#weather_ha")
						}
					}
					flag++
				})
				$.each(data2, function(idx, item) {
					if(flag1 < 7){
						$("<td></td>").html(item.substring(0,2)+"¢¥C").appendTo("#weather_te")
					}
					flag1++
				})
			}
		})

	})
</script>
 <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=HXDb6FFIbjhAcZeJhqjy&submodules=geocoder"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
	<table>
		<tr>asd</tr>
		<tr id="map"><jsp:include page="test_map.jsp"></jsp:include></tr>
		<tr id="weather_ti" style="text-align: center;"></tr>
		<tr id="weather_em" style="text-align: center;"></tr>
		<tr id="weather_ha"></tr>
		<tr id="weather_te" style="text-align: center;"></tr>
	</table>
	</center>
	 
</body>
</html>