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

		<form class="form-horizonta" action="insertBoard.com" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<input type="hidden" name="c_id" value="${se_id }">
				<input type="hidden" name="b_number" value="${b_number }">
				<label class="control-label col-sm-2" for="email">제목:</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" name="b_title" placeholder="제목을 입력해주세요!!">
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
				<label class="control-label col-sm-2" for="pwd">내용:</label>
				<br>
				<div class="col-sm-10">
					<textarea class="form-control" rows="10" cols="60" name="b_content" placeholder="내용을입력해주세요!"></textarea>
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
</body>
</html>
