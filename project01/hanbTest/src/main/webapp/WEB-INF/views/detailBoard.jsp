<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시물 상세</h2>
	<hr>
	글번호 : ${b.no }<br>
	제목 : ${b.title }<br>
	작성자 : ${b.writer }<br>
	내용 : <br>
	<textarea rows="10" cols="60" readonly="readonly">${b.content }</textarea><br>
	조회수 : ${b.hit }<br>
	등록일 : ${b.regdate }<br>
	ip주소 : ${b.ip }<br>
	첨부파일 : ${b.fname }(${b.fsize })
	<hr>
	<a href="insertBoard.do?no=${b.no }">답글작성</a>
</body>
</html>






