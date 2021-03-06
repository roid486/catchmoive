<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="m" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	#menu{
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
	  <h2>상영시간표 목록</h2>
	  <p><a href="insertr.com"><button class="btn btn-primary">시간표 추가</button></a></p>
	  <form action="rlist.com" method="post">
			<input type="date" name="key">
			<button type="submit" class="btn btn-primary">검색</button>
	  </form>
	  <table class="table table-striped">
	    <thead>
	      <tr>
	        <th>영화</th>
	        <th>영화관</th>
	        <th>상영관</th>
	        <th>상영날짜</th>
	        <th>상영시간</th>
	        <th>비고</th>
	      </tr>
	    </thead>
	    <tbody>
	    <m:forEach var="rl" items="${rl }">
	      <tr>
	        <td>${rl.m_name }</td>
	        <td>${rl.mt_name }</td>
	        <td>${rl.t_name }</td>
	        <td><fm:formatDate value="${rl.r_date }" pattern="yyyy.MM.dd"/></td>
	        <td>${rl.r_start }</td>
	        <td><a href="rupdate.com?r_number=${rl.r_number }"><button class="btn btn-primary">수정</button></a></td>
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