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
	#menu{
		position: relative;
		z-index: 999;
	}
	#clist{
		position: relative;
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
	<jsp:include page="/WEB-INF/views/mside.jsp"></jsp:include>
	<div class="container" id="clist" style="width: 60%;">
	  <h2>영화관 목록</h2>
	  <p><a href="insertmt.com"><button class="btn btn-primary">영화관 추가</button></a></p>
	  <form action="mtlist.com" method="post">
			<input type="text" name="key" placeholder="ID를 입력하시오.">
			<button type="submit" class="btn btn-primary">검색</button>
	  </form>
	  <table class="table table-striped">
	    <thead>
	      <tr>
	        <th>Name</th>
	        <th>LOC</th>
	        <th>비고</th>
	        <th>비고</th>
	      </tr>
	    </thead>
	    <tbody>
	    <m:forEach var="mtl" items="${mtl }">
	      <tr>
	        <td>${mtl.mt_name }</td>
	        <td>${mtl.mt_loc }</td>
	        <td><a href="mtupdate.com?c_id=${mtl.mt_number }"><button class="btn btn-primary">수정</button></a></td>
	        <td><a href="mtdelete.com?c_id=${mtl.mt_number }"><button class="btn btn-primary">삭제</button></a></td>
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