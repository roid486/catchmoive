<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* var customer_id */
		 <%-- var id1 = <%= session.getAttribute("se_id")%> --%>
		<%-- var id2 = "<%= (String)session.getAttribute("customerid2")%>" --%>
		 var id1 = $("#se_id").val();

	 	$("#msgdialog").dialog({
	         autoOpen:false,
	         modal:true
	      }); 
	
		$("#btn_insert").click(function() {
			alert("id1  ::   "+id1)
			if(id1==null || id1=="")
			{
				/* $("#msgdialog").dialog("open"); */
				alert("이삭이 msdialog");
			}
			else
			{
				location.href="insertBoard.com";
			} 			
		});
		
		
		//마우스효관
		$("#btn_insert").mouseover(function() {
			$("#btn_insert").text("글쓰기");
		});
		$("#btn_insert").mouseout(function() {
			$("#btn_insert").text("write");
		});
		
		//임의
		

		
	}); 

</script>
</head>
<body>
	<input type="hidden" id="se_id" value="${se_id }">
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>

	<h1>${title }</h1>
	<a href="listNotice.com">임시공지사항이동</a>

	<hr>
	<div class="table-responsive">
		<div class="container">
			<table class="table" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td>게시판번호</td>
					<td>TYPE</td>
					<td>제목</td>
					<td>ID</td>
					<td>작성자</td>
					<td>등록일</td>
					<td>조회수</td>
				</tr>


				<c:forEach var="b" items="${list }">
					<tr>
						<td>${b.b_number }</td>
						<td>${b.b_type }</td>
						<td><a href="detailBoard.com?b_number=${b.b_number }">${b.b_title }
								<c:if test="${b.b_recnt > 0}">
									<span class="badge"><span style="color: white;">(${b.b_recnt})</span></span>
								</c:if>
						</a></td>
						<td>${b.c_id }</td>
						<td>${b.c_name }</td>
						<td>${b.b_regdate }</td>
						<td>${b.b_hit }</td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>


	<hr>
	<center>
		<button class="btn btn-primary" id="btn_insert">write</button>
	</center>

	<form action="listBoard.com" method="post">
		<select name="searchField">
			<option value=c_id>id</option>
			<option value="b_title">제목</option>
			<option value="b_content">내용</option>
		</select> <input type="text" name="keyword"> <input type="submit"
			value="검색">
	</form>
	<div id="msgdialog">
		<center>
			<font color="red">로그인을 하십시오.</font>
		</center>
	</div>
</body>
</html>