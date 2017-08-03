<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	#menu{
		position: relative;
		z-index: 999;
	}
	#center{
		position: relative;
		z-index: 1;
	}
	#bottom {
	position: relative; background-color: brown; color: white;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function () {
				
	});
</script>
</head>
<body>
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
	<div id="msi">
		<jsp:include page="/WEB-INF/views/mside.jsp"></jsp:include>
	</div>
	<div id="center" style="width: 60%;">
		<div class="panel panel-info">
	      <div class="panel-heading"><h3>예매내역</h3></div>
	      <div class="panel-body">
				
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