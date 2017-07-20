<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	*{
		margin: 0px; padding: 0px;
	}
	.container{
		position: absolute; left: 0px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<div class="container" style="width:200px;">
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
</body>
</html>