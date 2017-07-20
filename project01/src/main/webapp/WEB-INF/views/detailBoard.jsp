<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상세보기</h2>
	<hr>
	Type: ${b.b_type }<br>
	글번호: ${b.b_number }<br>
	ID: ${b.c_id }<br>
	제목: ${b.b_title }<br>
	내용:<br>
	<textarea rows="10" cols="60" readonly="readonly">${b.b_content }</textarea><br>
	
	<img alt="" src="resources/jun/${b.b_fname }" width="100" height="100"><br>
	첨부파일:${b.b_fname }(파일크기: ${b.b_fsize })
	등록일:${b.b_regdate }<br>
	ip:${b.b_ip }<br>
	조회수:${b.b_hit }<br>

	
	<hr>
	<a href="updateBoard.com?b_number=${b.b_number }">게시물 수정</a>
	<a href="insertBoard.com?b_number=${b.b_number }">답글쓰기</a><br>
	<a href="deleteBoard.com?b_number=${b.b_number }">게시물삭제</a>
	
	

</body>
</html>
