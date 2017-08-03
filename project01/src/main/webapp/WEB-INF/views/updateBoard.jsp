<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시물 수정</h1>
	<hr>
	
	<form action="updateBoard.com" method="post" enctype="multipart/form-data">
	<input type="hidden" name="b_fname" value="${b.b_fname }">
	<input type="hidden" name="b_number" value="${b.b_number }">
	TYPE:	<select name="b_type">
				<option value="예매문의">예매문의</option>		
				<option value="영화문의">영화문의</option>		
				<option value="회원문의">회원문의</option>		
				<option value="기타">기타</option>		
			</select><br>
	제목 : <input type="text" name="b_title" value="${b.b_title }"><br>
	내용:<br>
	<textarea rows="10" cols="60" name="b_content">${b.b_content }</textarea><br>
	<img alt="" src="resources/jun/${b.b_fname }" width="60" height="60"><br>
	첨부파일:<input type="file" name="uploadFile"><br>
	<input type="submit" value="수정">
	</form>
</body>
</html>