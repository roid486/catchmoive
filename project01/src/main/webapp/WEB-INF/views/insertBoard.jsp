<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="se_id" value="${se_id }" >
	<h1>${head }</h1>
	<hr>

	<form action="insertBoard.com" method="post" enctype="multipart/form-data">
	
	<input type="hidden" name="c_id" value="${se_id }">
	<input type="hidden" name="b_number" value="${b_number }">
	<%-- <input type="hidden" name="board_b_ref" value="${board_b_ref }">
	<input type="hidden" name="board_b_step" value="${board_b_step }">
	<input type="hidden" name="board_b_level" value="${board_b_level }"> --%>
	제목:<input type="text" name="b_title"placeholder="제목을 입력해주세요!!"><br>
	TYPE:	<select name="b_type">
				<option value="예매문의">예매문의</option>		
				<option value="영화문의">영화문의</option>		
				<option value="회원문의">회원문의</option>		
				<option value="기타">기타</option>		
			</select><br>
	내용:<br>
	<textarea rows="10" cols="60" name="b_content" placeholder="내용을입력해주세요!"></textarea><br>
	첨부파일:<input type="file" name="uploadFile"><br>
	<input type="submit" value="등록">
	</form>

</body>
</html>
