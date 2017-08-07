<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#map {
	height: 400px;
	width: 60%;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
   $(function () {
	   
   });
</script>
<script>
      function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
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
	<center>
		<div id="map"></div>
	</center>
</body>
</html>