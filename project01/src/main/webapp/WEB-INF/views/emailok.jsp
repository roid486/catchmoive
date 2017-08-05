<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
<<<<<<< HEAD
#menu {
	position: relative;
	z-index: 999;
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
	#bottom {
	position: relative;   background-color:  #e6f3ff; color: black;
	}
>>>>>>> branch 'master' of https://github.com/roid486/catchmoive.git
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
	<center>
		<h1>${msg }</h1>
	</center>
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