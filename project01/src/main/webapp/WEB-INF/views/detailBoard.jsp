<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	var id1 = <%= session.getAttribute("se_id")%>
	
 	$("#msgdialog").dialog({
	    autoOpen:false,
	    modal:true
	 }); 

	listReply();
 	
	function listReply(){
		$.ajax({
			type:"get",
			url:"listReply.com?b_number=${b.b_number}",
			success: function(result) {
				alert("성공?!");
				$("#listReply").html(result);
			}		
		});	
	};
	
	//댓글쓰는거 	
	$("#btnReply").click(function() {
		
		var re_content = $("#re_content").val();
		var b_number = "${b.b_number}";
		var param="re_content= "+re_content+"&b_number= "+b_number;
		/* if(id1==null || id1=="")
		{
			$("#msgdialog").dialog("open");
		}
		else
		{
			alert("id1    ::  "+id1);
			alert("re_content  ::"   +re_content);
			alert("param    ::"    +param);
		} */
		$.ajax({
			type:"POST",
			url:"insertReply.com",
			data:param,
			success: function() {
				alert("댓글이 등록되었습니다.");
				listReply();
			}
					
		});
	});
	

	
	function changeDate(date){
        date = new Date(parseInt(date));
        year = date.getFullYear();
        month = date.getMonth();
        day = date.getDate();
        hour = date.getHours();
        minute = date.getMinutes();
        second = date.getSeconds();
        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
        return strDate;
    }
	
	
});
</script>
</head>
<body>
<input type="hidden" id="se_id" value="${se_id }" >
<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
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
	
    <div id="listReply"></div>
	<hr>
	
	<div style="width:650px; text-align: center;">
        <br>
        <!-- **로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
        <c:if test="${sessionScope.se_id != null}">
        <textarea rows="5" cols="80" id="re_content" placeholder="댓글을 작성해주세요"></textarea>
        <br>
        <button type="button" id="btnReply">댓글 작성</button>
        </c:if>
    </div>
    
 
    	
	<hr>
	<a href="updateBoard.com?b_number=${b.b_number }">게시물 수정</a>

	<a href="insertReply.com?b_number=${b.b_number }">댓글쓰기</a><br>
	<a href="deleteBoard.com?b_number=${b.b_number }">게시물삭제</a>
	
	
	
	
	
	
	<div id="msgdialog">
		<center><font color="red">로그인을 하십시오.</font></center>
	</div>
	

</body>
</html>
