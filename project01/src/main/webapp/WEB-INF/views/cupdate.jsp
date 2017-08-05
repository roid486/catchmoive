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
	#menu {
		position: relative;
		z-index: 999;
	}
	#clist{
		position: relative;
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
		var re = $("#re").val();
		if(re==1)
		{
			$("#erdial").dialog("open");
		}		
		var gender = $("#gender2").attr("data-type");
		$("#gender2").val(gender).text();
	    $("#gender2").find("option:"+gender).attr("selected","selected");
	});
</script>
</head>
<body>
	<input type="hidden" id="re" value="${re }">
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
	<div id="msi">
		<jsp:include page="/WEB-INF/views/mside.jsp"></jsp:include>
	</div>
	<div class="container" style="width:70%;">
	  <form class="form-horizontal" action="cupdate.com" method="post">
	  	<input type="hidden" name="c_echeck" value="${cdetail.c_echeck }">
	  	<input type="hidden" name="c_email1" value="${cdetail.c_email }">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="id">ID:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="id" readonly="readonly" name="c_id" value="${cdetail.c_id }">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="pw">Password:</label>
	      <div class="col-sm-10">
	        <input type="password" class="form-control" id="pw" placeholder="8자리 이상 입력하십시오." name="c_pw" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="pw2">Password 확인:</label>
	      <div class="col-sm-10">
	        <input type="password" class="form-control" id="pw2" placeholder="Password를 다시 입혁하십시오." name="c_pw2" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="name">Name:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="name" value="${cdetail.c_name }" name="c_name" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="age">Age:</label>
	      <div class="col-sm-10">          
	        <input type="date" class="form-control" id="age" name="c_age" value="${cdetail.c_age }" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="addr">Addr:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="adrr" name="c_addr" value="${cdetail.c_addr }" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="tel">Tel:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="tel" value="${cdetail.c_tel }" placeholder="전화번호를 '-'없이 입력하시오. " name="c_tel" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="email">Email:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="email" value="${cdetail.c_email }" name="c_email2" required="required">
	      </div>
	    </div>
	    <div class="form-group">        
	      <label class="control-label col-sm-2" for="gender2">Gender: </label>
	      <div class="col-sm-10">
	        <select class="form-control" id="gender2" name="c_gender" data-type="${cdetail.c_gender }">
			    <option value="남자">남자</option>
			    <option value="여자">여자</option>
			</select>
	      </div>
	    </div>
	    <div class="form-group">        
	      <label class="control-label col-sm-2" for="check">수신 동의: </label>
	      <div class="col-sm-10">
	        <label class="checkbox-inline" id="echeck">${cdetail.c_check }</label>
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="check2"></label>
	      <div class="col-sm-10">
	        <label class="checkbox-inline"><input type="radio" value="yes" id="check2" name="c_check">예</label>
			<label class="checkbox-inline"><input type="radio" value="no" id="check2" name="c_check">아니오</label>
	      </div>
	    </div>
	    <div class="form-group">        
	      <label class="control-label col-sm-2" for="echeck">Email 인증: </label>
	      <div class="col-sm-10">
	        <label class="checkbox-inline" id="echeck">${cdetail.c_echeck }</label>
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-default">수정</button>
	        <a href="masterpage.com" class="btn btn-default">취소</a>
	      </div>
	    </div>
	  </form>
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