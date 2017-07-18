<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>${head }</h1>
	<hr>
	
	<form action="insertBoard.com" method="post" enctype="multipart/form-data">
	<input type="hidden" name="b_number" value="${b_number }">
	<%-- <input type="hidden" name="board_b_ref" value="${board_b_ref }">
	<input type="hidden" name="board_b_step" value="${board_b_step }">
	<input type="hidden" name="board_b_level" value="${board_b_level }"> --%>
	제목:<input type="text" name="b_title"><br>
	암호:<input type="password" name="b_pwd"><br>
	내용:<br>
	<textarea rows="10" cols="60" name="b_content"></textarea><br>
	첨부파일:<input type="file" name="uploadFile"><br>
	<input type="submit" value="등록">
	</form>

</body>
</html>
<%-- 
<form action="insertBoard.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="no" value="${no }">
		<input type="hidden" name="b_ref" value="${b_ref }">
		<input type="hidden" name="b_step" value="${b_step }">
		<input type="hidden" name="b_level" value="${b_level }">
		
		제목 : <input type="text" name="title"><br>
		작성자 : <input type="text" name="writer"><br>
		암호 : <input type="password" name="pwd"><br>
		내용 : <br>
		<textarea rows="10" cols="60" name="content"></textarea><br>
		첨부파일 : <input type="file" name="uploadFile"><br>
		<input type="submit" value="등록">
	</form> --%>