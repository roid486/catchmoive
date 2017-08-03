<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="m" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/ui/jquery-ui.min.css">
<link rel="stylesheet" href="resources/ui/jquery-ui.structure.min.css">
<link rel="stylesheet" href="resources/ui/jquery-ui.theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	#mtl{
		position: relative;
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
		var re = $("#re").val();
		$("#erdial").dialog({
	         autoOpen:false,
	         modal:true
	      });
		if(re==1)
		{
			$("#erdial").dialog("open");
		}		
	});
</script>
</head>
<body>
	<input type="hidden" id="re" value="${re }">
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/mside.jsp"></jsp:include>
	<div class="container" id="mtl" style="width: 60%;">
	  <h2>상영관 등록</h2>
	  <form class="form-horizontal" action="insertt.com" method="post">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="name">Name:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="name" placeholder="상영관 이름을 입력하십시오." name="t_name" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="seat">Seat:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="seat" placeholder="상영관 좌석수를 입력하십시오." name="t_seat" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="mt">MovieTheater:</label>
	      <div class="col-sm-10">          
	        <select class="form-control" id="mt" name="mt_number">
			    <m:forEach var="mtl" items="${mtl }">
				    <option value="${mtl.mt_number }">${mtl.mt_name }</option>
			    </m:forEach>
			</select>
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-default">등록</button>
	      </div>
	    </div>
	  </form>
	</div>
	<br>
	<br>
	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
</body>
</html>