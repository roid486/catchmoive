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
	position: relative; background-color: brown; color: white;
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
	  <h2>이벤트 목록</h2>
	  <p><a href="inserte.com"><button class="btn btn-primary">이벤트 추가</button></a></p>
	  <form action="elist.com" method="post">
			<input type="text" name="key" placeholder="이벤트명을 입력하시오.">
			<button type="submit" class="btn btn-primary">검색</button>
	  </form>
	  
	  <table class="table table-striped">
	    <thead>
	      <tr>
	        <th>Title</th>
	        <th>Regdate</th>
	        <th>Hit</th>
	        <th>비고</th>
	        <th>비고</th>
	      </tr>
	    </thead>
	    <tbody>
	    <m:forEach var="el" items="${clist }">
	      <tr>
	        <td>${el.e_title }</td>
	        <td><fm:formatDate value="${el.e_regdate }" pattern="yyyy/MM/dd"/></td>
	        <td>${el.e_hit }</td>
	        <td><a href="eupdate.com?e_number=${el.e_number }"><button class="btn btn-primary">수정</button></a></td>
	        <td><a href="edelete.com?e_number=${el.e_number }"><button class="btn btn-primary">삭제</button></a></td>
	      </tr>
	    </m:forEach>
	    </tbody>
	  </table>
	  <center>
	  	${pagenum }
	  </center>
	</div>
	<br>
	<br>
	<div id="bottom">
		<label for="center"><jsp:include
				page="/WEB-INF/views/mainbottom.jsp">
		</jsp:include></label>
	</div>
</body>
</html>