<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	#menu {
		position: relative;
		z-index: 999;
	}
	#clist{
		position: relative;
		z-index: 1;
	}
	#bottom {
	position: relative;   background-color:  #e6f3ff; color: black;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function () {
				
	});
</script>
</head>
<body>
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
	<div id="msi">
		<jsp:include page="/WEB-INF/views/mside.jsp"></jsp:include>
	</div>
	<div class="container" id="clist" style="width: 60%;">
	  <h2>게시판목록</h2>
	  <p><a href="insertBoard.com"><button class="btn btn-primary">게시글 추가</button></a></p>
	  <form action="blist.com" method="post">
			<input type="text" name="key" placeholder="게시글명을 입력하시오.">
			<button type="submit" class="btn btn-primary">검색</button>
	  </form>
	  
	  <table class="table table-striped">
	    <thead>
	      <tr>
	        <th>문의</th>
	        <th>제목</th>
	        <th>등록날짜</th>
	        <th>작성자</th>
	        <th>비고</th>
	      </tr>
	    </thead>
	    <tbody>
	    <m:forEach var="bl" items="${clist }">
	      <tr>
	        <td>${bl.b_type }</td>
	        <td>${bl.b_title }</td>
	        <td>${bl.b_regdate }</td>
	        <td>${bl.c_name }</td>
	        <td><a href="deleteBoard.com?b_number=${bl.b_number }"><button class="btn btn-primary">삭제</button></a></td>
	      </tr>
	    </m:forEach>
	    </tbody>
	  </table>
	  <center>
	  	${pagenum }
	  </center>
	</div>
	<p></p>
	<p></p>
	<p></p>
	<br>
	<br>
	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
</body>
</html>