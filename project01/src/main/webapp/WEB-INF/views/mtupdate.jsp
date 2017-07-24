<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#clist{
		position: relative;
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
	<div class="container" style="width:70%;">
	  <form class="form-horizontal" action="mtupdate.com" method="post">
	  	<input type="hidden" name="mt_number" value="${mtdetail.mt_number }">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="name">Name:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="name" name="mt_name" value="${mtdetail.mt_name }">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="loc">Loc:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="loc" value=" name="mt_loc" ${mtdetail.mt_loc }" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="x">X좌표:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="x" name="mt_x" value="${mtdetail.mt_x }" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="y">Y좌표:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="y" name="mt_y" value="${mtdetail.mt_y }" required="required">
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-default">수정</button>
	        <a href="mtlist.com" class="btn btn-default">취소</a>
	      </div>
	    </div>
	  </form>
	</div>
	<div id="erdial">
		<font color="red">${msg }</font>
	</div>
</body>
</html>