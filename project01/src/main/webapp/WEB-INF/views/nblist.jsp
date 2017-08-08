<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	  <h2>공지사항 목록</h2>
	  <p><a href="insertNotice.com"><button class="btn btn-primary">공지사항 추가</button></a></p>
	  <form action="nblist.com" method="post">
			<input type="text" name="key" placeholder="공지사항명을 입력하시오.">
			<button type="submit" class="btn btn-primary">검색</button>
	  </form>
	  
	  <table class="table table-striped">
	    <thead>
	      <tr>
	        <th>공지사항 번호</th>
	        <th>제목</th>
	        <th>등록날짜</th>
	        <th>비고</th>
	        <th>비고</th>
	      </tr>
	    </thead>
	    <tbody>
	    <m:forEach var="nbl" items="${clist }">
	      <tr>
	        <td>${nbl.nb_number }</td>
	        <td>${nbl.nb_title }</td>
	        <td><fm:formatDate value="${nbl.nb_regdate }" pattern="yyyy/MM/dd-HH:mm:ss"/> </td>
	        <td><a href="updateNotice.com?nb_number=${nbl.nb_number }"><button class="btn btn-primary">수정</button></a></td>
	        <td><a href="deleteNotice.com?nb_number=${nbl.nb_number }"><button class="btn btn-primary">삭제</button></a></td>
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