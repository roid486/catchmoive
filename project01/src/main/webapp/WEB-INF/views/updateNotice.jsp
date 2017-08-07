<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항 수정</h1>
	<hr>

	<form action="updateNotice.com" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="nb_fname" value="${b.b_fname }"> <input
			type="hidden" name="nb_number" value="${n.nb_number }"> 제목 :
		<input type="text" name="nb_title" value="${n.nb_title }"><br>
		내용:<br>
		<textarea rows="10" cols="60" name="nb_content">${n.nb_content }</textarea>
		<br> <img alt="" src="resources/noticejun/${n.nb_fname }"
			width="60" height="60"><br> 첨부파일:<input type="file"
			name="uploadFile"><br> <input type="submit" value="수정">
	</form>

</body>
</html>