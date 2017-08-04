<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function() {
	// 게시글 삭제 버튼 클릭이벤트
    $("#btn_del").click(function(){
        if(confirm("삭제하시겠습니까?"))
        {
        	return true;
        }
        return false;
        
    });
   
 // 게시글 수정 버튼 클릭이벤트
    $("#btn_update").click(function(){
        if(confirm("수정하시겠습니까??"))
        {
        	return true;
        }
        return false;
        
    });
	
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<h2>상세화면</h2>
	<hr>
	글번호 : ${n.nb_number }
	<br> 제목 : ${n.nb_title }
	<br> 내용 :
	<br>
	<textarea rows="10" cols="60" readonly="readonly">${n.nb_content }</textarea>
	<br> 조회수 : ${n.nb_hit }
	<br> 등록일 : ${n.nb_regdate }
	<br>
	<img alt="" src="resources/noticejun/${n.nb_fname }" width="100"
		height="100">
	<br> 첨부파일 : ${n.nb_fname }(${n.nb_fsize })
	<hr>

	<a href="deleteNotice.com?nb_number=${n.nb_number }"><button
			type="button" id="btn_del">삭제</button></a>
	<a href="updateNotice.com?nb_number=${n.nb_number }"><button
			type="button" id="btn_update">수정</button></a>

	<div id="msgdialog">
		<center>
			<font color="red">로그인을 하십시오.</font>
		</center>
	</div>

</body>
</html>