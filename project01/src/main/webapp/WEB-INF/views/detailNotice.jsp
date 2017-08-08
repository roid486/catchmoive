<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 게시글 삭제 버튼 클릭이벤트
		$("#btn_del").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				return true;
			}
			return false;

		});

		// 게시글 수정 버튼 클릭이벤트
		$("#btn_update").click(function() {
			if (confirm("수정하시겠습니까??")) {
				return true;
			}
			return false;

		});

	});
</script>
<style type="text/css">
.control-label-col {
	font-size: 18px;
}

.col-sm-offset-2-col-sm-8 {
	position: relative;
}

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

	<!-- Sidebar -->
	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 10%; border: 1px solid #80d4ff" id="side">
		<h3 class="w3-bar-item" id="w3-bar-item">Side Bar</h3>
		<a href="listBoard.com" class="w3-bar-item w3-button">게시판</a> <br> <a href="listNotice.com" class="w3-bar-item w3-button">공지사항</a> <br> <br>

	</div>

	<div style="margin-left: 0%">
		<div class="container">

			<form class="form-horizontal">
				
				<center>
				<h2>
					<font style="color: #8CCBFB">상세보기</font>
				</h2>
				</center>
				<hr style="border: solid 1px #A1D6FE;">




				<div class="form-group">
					<label class="control-label col-sm-2">글번호 : </label> <label class="control-label-col">${n.nb_number }</label>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">제목 :</label> <label class="control-label-col">${n.nb_title }</label>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">등록일 : </label> <label class="control-label-col"> ${n.nb_regdate }</label>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">내용:</label>
					<div class="col-sm-10">
						<textarea class="control-label-col" rows="10" cols="60" readonly="readonly">${n.nb_content }</textarea>
					</div>
				</div>



				<div class="form-group">
					<label class="control-label col-sm-2">조회수 :</label> <label class="control-label-col">${n.nb_hit }</label>
				</div>

				<br>
				<div class="form-group">
					<label class="control-label col-sm-2">첨부파일 :</label> <label class="control-label-col">${n.nb_fname }</label>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2">&nbsp&nbsp&nbsp</label>
					<div class="col-sm-10">
						<img class="control-label-col" alt="" src="resources/noticejun/${n.nb_fname }" width="100" height="100">
					</div>
				</div>
				<br>

				<hr style="border: solid 1px #A1D6FE;">



				<a href="updateNotice.com?nb_number=${n.nb_number }"><button type="button"  class="btn btn-default"style="color: #8CCBFB" id="btn_update">수정</button></a>

				<a href="deleteNotice.com?nb_number=${n.nb_number }"><button type="button" class="btn btn-default"style="color: #8CCBFB" id="btn_del">삭제</button></a>
				<br>
			</form>
			<br>
		</div>
	</div>

	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
</body>
</html>