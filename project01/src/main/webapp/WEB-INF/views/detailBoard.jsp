<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<%-- var id1 = <%= session.getAttribute("se_id")%> --%>
	var id1 = $("#se_id").val();
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
				$("#listReply").html(result);
			}		
		});	
	}; 
	
	//댓글쓰는거 	
	$("#btnReply").click(function() {
		
		var re_content = $("#re_content").val();
		var b_number = "${b.b_number}";
		//비밀댓글체크여부
		var re_secretreply = "n";
		//태그.is(":속성") 체크여부 true/false
		if( $("#re_secretreply").is(":checked") ){
			re_secretreply = "y";
			
        }
		alert(re_secretreply);
		//비밀댓글 파라미터 추가
		var param="re_content= "+re_content+"&b_number= "+b_number+"&re_secretreply="+re_secretreply;
	
		$.ajax({
			type:"POST",
			dataType:"text",
			url:"insertReply.com",
			data:param,
			success: function(data) {
				alert("댓글이 등록되었습니다.");
				listReply();
			},
			error: function(data){
				alert("댓글이 등록되었습니다.");
				listReply();
			}
					
		});
	});
	
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
<style>
#modifyReply {
	width: 600px;
	height: 130px;
	background-color: gray;
	padding: 10px;
	z-index: 10;
	visibility: hidden;
}

.form-group {
	
}

.control-label-col {
	font-size: 20px;
}

.col-sm-offset-2-col-sm-8 {
	position: relative;
}
</style>
</head>

<body>
	<input type="hidden" id="se_id" value="${se_id }">
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<form class="form-horizontal">

		<center>
			<h2>
				<font style="color: #8CCBFB">상세보기</font>
			<c:if test="${sessionScope.se_id == b.c_id}">
				<a href="updateBoard.com?b_number=${b.b_number }">
				<button type="button" class="btn btn-default" style="color: #8CCBFB" id="btn_update">수정</button>
				</a> 
				<a href="deleteBoard.com?b_number=${b.b_number }">
				<button type="button" class="btn btn-default" style="color: #8CCBFB" id="btn_del">삭제</button>
				</a>
				</c:if>
				
				
			</h2>
		</center>

		<%-- 			<!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
			<c:if test="${sessionScope.se_id == b.c_id}">
				<div class="container">
					<div class="col-sm-offset-2-col-sm-8">
						<a href="updateBoard.com?b_number=${b.b_number }">
							<button type="button" class="btn btn-default" style="color: #8CCBFB" id="btn_update">수정</button>
						</a> <a href="deleteBoard.com?b_number=${b.b_number }">
							<button type="button" class="btn btn-default" style="color: #8CCBFB" id="btn_del">삭제</button>
						</a>
					</div>
				</div>
			</c:if>
		 --%>

		<hr style="border: solid 1px #A1D6FE;">

		<div class="form-group">
			<label class="control-label col-sm-2">Type :</label> <label class="control-label-col">${b.b_type }</label>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2">글번호 : </label> <label class="control-label-col">${b.b_number }</label>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">ID : </label> <label class="control-label-col">${b.c_id }</label>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">작성자 : </label> <label class="control-label-col">${b.c_name }</label>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">제목 :</label> <label class="control-label-col">${b.b_title }</label>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="pwd">내용:</label>
			<div class="col-sm-10">
				<textarea class="control-label-col" rows="10" cols="60" readonly="readonly">${b.b_content }</textarea>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2">첨부파일 :</label> <label class="control-label-col">${b.b_fname }</label>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">&nbsp&nbsp&nbsp</label>
			<div class="col-sm-10">
				<img class="control-label-col" alt="" src="resources/jun/${b.b_fname }" width="100" height="100">
			</div>
		</div>
		<br>
		<div class="form-group">
			<label class="control-label col-sm-2">조회수 :</label> <label class="control-label-col">${b.b_hit }</label>
		</div>

		<br>
		<div class="form-group">
			<label class="control-label col-sm-2">총 댓글 수: </label> <label class="control-label-col"> ${b.b_recnt}개</label>
		</div>



		<hr style="border: solid 1px #A1D6FE;">


		<div id="listReply"></div>
		<hr>



		<!-- 로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
		<c:if test="${sessionScope.se_id != null}">
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">&nbsp&nbsp&nbsp</label>
				<div class="col-sm-10">
					<textarea class="control-label-col" rows="5" cols="80" id="re_content" placeholder="댓글을 작성해주세요"></textarea>
				</div>
				<!-- **비밀댓글 체크박스 -->

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label><input type="checkbox" id="re_secretreply">비밀 댓글</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="btn btn-info" id="btnReply">댓글 작성</button>
					</div>
				</div>
			</div>
		</c:if>

	</form>


	<div id="msgdialog">
		<center>
			<font color="red">로그인을 하십시오.</font>
		</center>
	</div>
</body>
</html>
