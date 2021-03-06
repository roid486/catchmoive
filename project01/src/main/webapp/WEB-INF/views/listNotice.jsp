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

#side {
	position: absolute; 
	top:500px;
	color: #80d4ff;
}
#w3-bar-item {
	font-family: -윤고딕340;
}
#bottom {

	position: relative;   background-color:  #e6f3ff; color: black;

}
</style>
</head>
<body>
	<%-- <input type="hidden" id="se_id" value="${se_id }" > --%>
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>

	<!-- Sidebar -->
	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 10%; border: 1px solid #80d4ff" id="side">
		<h3 class="w3-bar-item" id="w3-bar-item">Side Bar</h3>
		<a href="listBoard.com" class="w3-bar-item w3-button">게시판</a> <br> <a href="listNotice.com" class="w3-bar-item w3-button">공지사항</a> <br> <br>

	</div>

	<div style="margin-left: 0%">



		<center>
			<h1>
				<strong style="color: #8CCBFB">공지사항</strong>
			</h1>
		</center>

		
		
		<div class="table-responsive">
			<div class="container">

<hr style="border:solid 1px #A1D6FE;">



				<table id="table" class="table">
					<tr>
				
						<td align="center" bgcolor="#A1D6FE" colspan="2">제목</td>
						<td align="center" bgcolor="#A1D6FE">작성일</td>
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
<hr style="border:solid 1px #A1D6FE;">
				
				<form action="listNotice.com" method="post">
					<select name="searchField">
						<option value="nb_title">제목</option>
						<option value="nb_content">내용</option>
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="검색">
				</form>



				<center>${pageStr }</center>
			</div>
		</div>
	</div>
	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
</body>
</html>