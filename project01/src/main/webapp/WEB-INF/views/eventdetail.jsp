<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
	#menu {
		position: relative;
		z-index: 999;
	}
	#bottom {
	position: relative;   background-color:  #e6f3ff; color: black;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function () {
		$("#backcom").click(function () {
			location.href="event.com";
		});
	});
</script>
</head>
<body>
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
	
	<div class="container">
	  <h2 style="font-family: -윤고딕340;">이벤트 정보</h2>           
	  <table class="table table-striped">
	    <thead style="font-size: 20px; font-family: -윤고딕340;">
	      <tr>
	        <th>이벤트 제목 : ${ede.e_title }</th>
	        <th>이벤트 게시 날짜 : <fm:formatDate value="${ede.e_regdate }" pattern="yyyy/MM/dd"/></th>
	        <th>조회수 : ${ede.e_hit }</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td colspan="3" align="center"><img src="resources/eventimg/${ede.e_img}" class="img-rounded" alt="Cinque Terre" width="700" height="600"></td>
	      </tr>
	      <tr>
	      	<td colspan="3" style="font-family: -윤고딕340;">내용</td>
	      </tr>
	      <tr>
	        <td colspan="3" align="center"><pre>${ede.e_content }</pre></td>
	      </tr>
	    </tbody>
	  </table>
	</div>
	<center>
		<button id="backcom">목록보기</button>
	</center>
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