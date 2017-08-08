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
#bottom {
	position: relative;
	background-color: #e6f3ff;
	color: black;
}

#w3-bar-item {
	font-family: -윤고딕340;
	color: #80d4ff;
}

#side {
	position: absolute;
	top: 500px;
	color: #80d4ff;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<input type="hidden" id="se_id" value="${se_id }">
	<!-- Sidebar -->
	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 10%; border: 1px solid #80d4ff" id="side">
		<h3 class="w3-bar-item" id="w3-bar-item">Side Bar</h3>
		<a href="listBoard.com" class="w3-bar-item w3-button">게시판</a> <br> <a href="listNotice.com" class="w3-bar-item w3-button">공지사항</a> <br> <br>

	</div>

	<div style="margin-left: 0%">

		<div class="container">

			<h1>
				<font style="color: #8CCBFB">수정하기</font>
			</h1>

			<hr>

			<form class="form-horizontal" action="updateBoard.com" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<input type="hidden" name="b_fname" value="${b.b_fname }">
					<input type="hidden" name="b_number" value="${b.b_number }">

					<label class="control-label col-sm-2" for="email">제목:</label>
					<div class="col-sm-5">
						<input class="form-control" type="text" name="b_title" value="${b.b_title }">
						<br>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">TYPE:</label>
					<div class="col-sm-5">
						<select class="form-control" name="b_type">
							<option value="예매문의">예매문의</option>
							<option value="영화문의">영화문의</option>
							<option value="회원문의">회원문의</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>
				<br>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">내용:</label> <br>
					<div class="col-sm-10">
						<textarea class="form-control" rows="10" cols="60" name="b_content">${b.b_content }</textarea>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">&nbsp&nbsp&nbsp</label>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">첨부파일:</label>
					<div class="col-sm-10">
						<input type="file" name="uploadFile">
					</div>
					<div class="col-sm-4">
						<img class="form-control" alt="" src="resources/jun/${b.b_fname }" width="100" height="100">
					</div>
				</div>
				
				<br>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input class="btn btn-info" type="submit" value="수정">
					</div>
				</div>
			</form>
		</div>

	</div>
	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
</body>
</html>