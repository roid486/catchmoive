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
	#mtl{
		position: relative;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function () {
		var re = $("#re").val();
			
	});
</script>
</head>
<body>
	<input type="hidden" id="re" value="${re }">
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/mside.jsp"></jsp:include>
	<div class="container" id="mtl" style="width: 60%;">
	  <h2>상영관 등록</h2>
	  <form class="form-horizontal" action="eupdate.com" method="post" enctype="multipart/form-data">
	  	<input type="hidden" name="e_number" value="${edetail.e_number }">
	  	<input type="hidden" name="fname" value="${edetail.e_img }">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="title">Title:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="title" value="${edetail.e_title }" placeholder="이벤트제목을 입력하십시오." name="e_title" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="img">Image:</label>
	      <div class="col-sm-10">          
	        <input type="file" class="form-control" id="img" name="file">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="content">Content:</label>
	      <div class="col-sm-10">          
	       <textarea class="form-control" rows="5" id="comment" name="e_content" placeholder="이벤트내용을 입력하십시오." required="required">${edetail.e_content }</textarea>
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-default">등록</button>
	      </div>
	    </div>
	  </form>
	</div>
</body>
</html>