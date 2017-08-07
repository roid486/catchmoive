<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#msgdialog").dialog({
        autoOpen:false,
        modal:true
     }); 
});	
</script>
<style type="text/css">
#table {
	width: 100%;
	border: 1px solid black;
	border-right: none;
	border-left: none;
	border-bottom: none;
}

tr, th, td {
	padding: 10px;
}

#menu {
	position: absolute;
	top: 500px;
	color: #80d4ff;
}

#w3-bar-item {
	font-family: -윤고딕340;
}
</style>
</head>
<body>
	<%-- <input type="hidden" id="se_id" value="${se_id }" > --%>
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>

	<!-- Sidebar -->
	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 15%; border: 1px solid #80d4ff" id="menu">
		<h3 class="w3-bar-item" id="w3-bar-item">Side Bar</h3>
		<a href="listBoard.com" class="w3-bar-item w3-button">게시판</a> <br> <a href="listNotice.com" class="w3-bar-item w3-button">공지사항</a> <br> <br>
	</div>


	<div style="margin-left: 15%">


		<center>
			<h1>
				<strong style="color: #8CCBFB">공지사항</strong>
			</h1>
		</center>
		<hr>
		<div class="table-responsive">
			<div class="container">

				<form action="listNotice.com" method="post">
					<select name="searchField">
						<option value="nb_title">제목</option>
						<option value="nb_content">내용</option>
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="검색">
				</form>
				<hr>
				


				<table id="table" class="table">
					<tr>
						<!-- <td>
								<td align="center" bgcolor="#A1D6FE" >번호</td>	
									<a href="listNotice.com?orderField=nb_number">번호</a>
							</td> -->

						<td align="center" bgcolor="#A1D6FE" colspan="2">제목</td>
						<!-- <a href="listNotice.com?orderField=nb_title"> 제목</a> -->
 

						<td align="center" bgcolor="#A1D6FE">작성일</td>
						<!-- <a href="listNotice.com?orderField=nb_regdate"> 작성일</a> -->

						<td bgcolor="#A1D6FE">조회</td>
					</tr>
					<c:forEach var="n" items="${list }">
						<tr>
						
							<td width="15%">${n.nb_number }</td>
							<td width="50%">
								<a href="detailNotice.com?nb_number=${n.nb_number }">${n.nb_title }</a>
							</td>
							<td width="25%">${n.nb_regdate }</td>
							<td>${n.nb_hit }</td>

						</tr>
					</c:forEach>
				</table>
				
		
				<center>${pageStr }</center>
				<div id="msgdialog">
					<center>
						<font color="red">로그인을 하십시오.</font>
					</center>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

