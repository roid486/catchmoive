<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		var id1 = $("#se_id").val();
		
		function listReply(){
			
			$.ajax({
				type:"get",
				url:"listReply.com?re_number=${r.re_number}",
				success: function() {
					alert("여긴성공");
				},
				error: function() {
					alert("여긴에러");
					
				}
			});	
		}; 
		
		function listRe(){
			
			
			var b_number = "${r.b_number}";
		
			if(id1==null || id1=="")
			{
				alert("아이디가없을리가?");
			}
			else
			{
				
				location.href="detailBoard.com?b_number=${r.b_number}";
			} 			
		};
		
		// 댓글 수정
		$("#btnReplyUpdate").click(
				function() {
					if (confirm("수정하시겠습니까?")) {
						var re_content = $("#re_content").val();
						var re_number = "${r.re_number}";
						
						var param = "re_content" + re_content + "&re_number= "
								+ re_number;
						
						$.ajax({
							type : "post",
							dataType : "text",
							url : "updateReply.com?re_number=${r.re_number}",
							data : {
								"re_content" : re_content,
								"re_number" : re_number
							},
							success : function(data) {
								alert("댓글이 수정되었습니다");
								$("#modifyReply").css("visibility", "hidden");
								// 댓글 목록 갱신
								listRe();
								//listReply();
							},
							error : function(data) {
								alert("댓글이 수정되었습니다");
								$("#modifyReply").css("visibility", "hidden");
								// 댓글 목록 갱신
								listRe();
								//listReply();
							}
						});
					}
				});
		// 5. 댓글 삭제
		$("#btnReplyDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				var re_number = "${r.re_number}";
				var param ="re_number="+re_number;
				alert(re_number);
				$.ajax({
					type : "delete",
					url : "deleteReply.com?re_number=${r.re_number}",
					data : param,
					success : function(data) { 
							alert("삭제되었습니다.");
							$("#modifyReply").css("visibility", "hidden");
					},
					error: function(data) {
						alert("삭제되엇어요 ");
						
						$("#modifyReply").css("visibility", "hidden");
						
						//listRe();
						listReply();
					}
				});
			}
		});
		//  댓글 상세화면 닫기
		$("#btnReplyClose").click(function() {
			$("#modifyReply").css("visibility", "hidden");
		});
	});
</script>
</head>
<body>
	<div class="container">

	<input type="hidden" id="se_id" value="${se_id }"><font style="color: #FFFFFF">번호 :${r.re_number}&nbsp&nbsp ${r.c_name }</font> 
	<br>
	
	<textarea id="re_content" rows="6" cols="150">${r.re_content}</textarea>
	<div style="text-align: center;">
		<!-- 본인 댓글만 수정, 삭제가 가능하도록 처리 -->
		<c:if test="${sessionScope.se_id == r.c_id}">

			<br>
			<label><input type="checkbox" id="re_secretreply">비밀 댓글</label>				
			<button class="btn btn-default" style="color: #8CCBFB" type="button" id="btnReplyUpdate">수정</button>
			<button class="btn btn-default" style="color: #8CCBFB" type="button" id="btnReplyDelete">삭제</button>
			
		</c:if>

		<button class="btn btn-default" style="color: #8CCBFB" type="button" id="btnReplyClose">닫기</button>
	</div>
	</div>
</body>
</html>