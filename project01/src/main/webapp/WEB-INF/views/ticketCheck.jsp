<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<style type="text/css">
*{
font-weight: bold;
text-align: center;
}
body{
background: #FEFFD5;
}
td{
width:45px;
}
#weather_ha{
font-size: 10px;
text-align: center;
}
#form{
width:346px;
border: 4px solid black;
border-radius: 0px 0px 10px 10px; 
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
<script type="text/javascript">
	$(function() {
		
		var loc = "${info.mt_loc}";
		var x = "${info.mt_x}";
		var y = "${info.mt_y}";
	
	var flag = 0;
	var flag1 = 0;
	
	var toas = function(){
		toastr.options = {
                closeButton: true,
                "positionClass": "toast-top-right",
                progressBar: true,
                showMethod: 'slideDown',
                "extendedTimeOut": "2000",
                timeOut: 5000
            };
            toastr.success('20초 뒤에 자동 종료됩니다.');
	}
	
	setTimeout(function(){
		toas();
	}, 4000);

	setTimeout(function(){
		window.close();
	}, 20000);


	
		$.ajax({
			url : "weather.jsp",
			dataType : "json",
			type : "GET",
			data : {
				loc : loc,
				mx : x,
				my : y
			},
			success : function(data) {
				var data1 = data.weather.forecast3days[0].fcst3hour.sky;
				var data2 = data.weather.forecast3days[0].fcst3hour.temperature;
				
				$.each(data1, function(idx, item) {
					if(flag < 14){
						time = idx.substring(idx.indexOf("e")+1,idx.indexOf("h"))
						if(!item.indexOf("S")){
							$("<td></td>").html(time+":00").appendTo("#weather_ti");
							$("<td></td>").html("<img width='35px' height='30px' src='resources/eunseok/weather_icons/"+item+".png'>").appendTo("#weather_em")
						}
						else{
							$("<td></td>").html(item).appendTo("#weather_ha")
						}
					}
					flag++
				})
				$.each(data2, function(idx, item) {
					if(flag1 < 7){
						$("<td></td>").html(item.substring(0,2)+"℃").appendTo("#weather_te")
					}
					flag1++
				})
			}
		})
		$("button").click(function(){
			
			window.close();
			
		})
		
	
		
	})
</script>
<link href="resources/eunseok/toast/toastr.scss" rel="stylesheet">
    <script src="resources/eunseok/toast/toastr.js"></script>
 <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=HXDb6FFIbjhAcZeJhqjy&submodules=geocoder"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Æ¼ÄÏ</title>
</head>
<body>
<center>
	<table id ="ti" style="width: 348px; height: 50%; border:4px solid black; border-radius: 10px 10px 0px 0px;" >
		<tr><td style="width: 10%;" rowspan="4"><img src="resources/upload/${t.m_image }" width="100px" height="130px"></td><td width="*">${t.m_name }</td></tr>
		<tr><td>${t.mt_name } ${t.t_name }</td></tr>
		<tr><td>${t.r_date } ${t.r_start }</td></tr>
		<tr><td>인원: ${t.ticket_peoplenum }¸날짜: ${seat_rc }</td></tr>
		</table>
	<table id="form">
		<tr id="map"><jsp:include page="map.jsp"><jsp:param name="mx" value="${info.mt_x}"/><jsp:param name="my" value="${info.mt_y}"/></jsp:include></tr>
		<tr id="weather_ti" style="text-align: center;"></tr>
		<tr id="weather_em" style="text-align: center;"></tr>
		<tr id="weather_ha"></tr>
		<tr id="weather_te" style="text-align: center;"></tr>
	</table>
	<br>
<button type="button" class="btn btn-primary btn-lg active">확인</button>
	</center>
</body>
</html>