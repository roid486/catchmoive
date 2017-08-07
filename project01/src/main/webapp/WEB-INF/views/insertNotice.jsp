<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<input type="hidden" id="se_id" value="${se_id }">
<div class="container">
		<h1><strong>${head }</strong></h1>
		<hr>
	<form action="insertNotice.com" method="post" enctype="multipart/form-data">
		<input type="hidden" name="nb_number" value="${nb_number }">
		제목 :
		<input type="text" name="nb_title">
		<br> 내용 : <br>
		<textarea rows="10" cols="60" name="nb_content"></textarea>
		<br> 첨부파일 :
		<input type="file" name="uploadFile">
		<br>
		<input type="submit" value="등록">
	</form>
</body>
</html>