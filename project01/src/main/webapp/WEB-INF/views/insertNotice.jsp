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
<style type="text/css">
#side {
	position: absolute;
	top: 500px;
	color: #80d4ff;
}

#w3-bar-item {
	font-family: -윤고딕340;
}

#bottom {
	position: relative;
	background-color: #e6f3ff;
	color: black;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<input type="hidden" id="se_id" value="${se_id }">
	<div class="container">
		<h1>
			<strong style="color: #8CCBFB">${head }</strong>
		</h1>
		<hr>
		<form class="form-horizontal" action="insertNotice.com" method="post" enctype="multipart/form-data">
			<input type="hidden" name="nb_number" value="${nb_number }">
			<div class="form-group">
				<label class="control-label col-sm-2">제목:</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" name="nb_title" placeholder="제목을 입력해주세요!!">
				</div>
			</div>
			<br>
			<div class="form-group">
				<label class="control-label col-sm-2">내용:</label> <br>
				<div class="col-sm-10">
					<textarea class="form-control" rows="10" cols="60" name="nb_content" placeholder="내용을입력해주세요!"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">첨부파일:</label>
				<div class="col-sm-10">
					<input type="file" name="uploadFile">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input class="btn btn-info" type="submit" value="등록">
				</div>
			</div>
		</form>

	</div>
	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
</body>
</html>