<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/ui/jquery-ui.min.css">
<link rel="stylesheet" href="resources/ui/jquery-ui.structure.min.css">
<link rel="stylesheet" href="resources/ui/jquery-ui.theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
#mtl {
	position: relative;
}

#bottom {
	position: relative;
	background-color: brown;
	color: white;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function () {
		var re = $("#re").val();
		if(re==1)
		{
			$("#erdial").dialog("open");
		}		
	});
</script>
</head>
<body>
	<input type="hidden" id="re" value="${re }">
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/mside.jsp"></jsp:include>
	<div class="container" id="mtl" style="width: 60%;">
		<h2>영화관 등록</h2>
		<form class="form-horizontal" action="insertmt.com" method="post"
			enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">Name:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="name"
						placeholder="영화관 이름을 입력하십시오." name="mt_name" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="loc">Loc:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="loc"
						placeholder="영화관 주소를 입력하십시오." name="mt_loc" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="img">iamge:</label>
				<div class="col-sm-10">
					<input type="file" class="form-control" id="img" name="file"
						required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="x">X:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="x"
						placeholder="X좌표를 입력하십시오." name="mt_x" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="y">Y:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="y"
						placeholder="Y좌표를 입력하십시오." name="mt_y" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">등록</button>
				</div>
			</div>
		</form>
	</div>
	<br>
	<br>
	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
</body>
</html>