<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	*{
		margin: 0px; padding: 0px;
	}
	#mside{
		position: absolute; left: 0px; cursor: pointer;
	}
	#clist{
		position: relative;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function () {
		$(".cupdate").click(function () {
			alert($(".c_id").text());
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<div id="mside" class="container" style="width:200px;">
	  <table class="table">
	    <thead>
	      <tr>
	        <th>MasterMenu</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr id="customer">
	        <td>회원정보</td>
	      </tr>      
	      <tr class="success" id="movie">
	        <td>영화정보</td>
	      </tr>
	      <tr class="danger" id="movietheater">
	        <td>영화관정보</td>
	      </tr>
	      <tr class="info" id="theater">
	        <td>상영관정보</td>
	      </tr>
	      <tr class="warning" id="running">
	        <td>상영시간표정보</td>
	      </tr>
	      <tr class="warning" id="board">
	        <td>게시판정보</td>
	      </tr>
	      <tr class="active" id="noticeboard">
	        <td>공지사항정보</td>
	      </tr>
	      <tr id="event">
	        <td>이벤트정보</td>
	      </tr>
	    </tbody>
	  </table>
	</div>
	<div class="container" id="clist" style="width: 900px;">
	  <h2>회원목록</h2>
	  <form action="masterpage.com" method="post">
			<input type="text" name="key" placeholder="ID를 입력하시오.">
			<button type="submit" class="btn btn-primary">검색</button>
	  </form>
	  <table class="table table-striped">
	    <thead>
	      <tr>
	        <th>ID</th>
	        <th>Name</th>
	        <th>Address</th>
	        <th>Email</th>
	        <th>비고</th>
	        <th>비고</th>
	      </tr>
	    </thead>
	    <tbody>
	    <m:forEach var="cl" items="${clist }">
	      <tr>
	        <td>${cl.c_id }</td>
	        <td>${cl.c_name }</td>
	        <td>${cl.c_addr }</td>
	        <td>${cl.c_email }</td>
	        <td><a><button class="btn btn-primary">수정</button></a></td>
	        <td><a href="cdelete.com?c_id=${cl.c_id }"><button class="btn btn-primary">삭제</button></a></td>
	      </tr>
	    </m:forEach>
	    </tbody>
	  </table>
	  <center>
	  	${pagenum }
	  </center>
	</div>
	
</body>
</html>