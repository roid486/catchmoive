<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/ui/jquery-ui.min.css">
<link rel="stylesheet" href="resources/ui/jquery-ui.structure.min.css">
<link rel="stylesheet" href="resources/ui/jquery-ui.theme.min.css">
<style type="text/css">
	#menu{
		position: relative;
		z-index: 999;
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function () {
		var msg = $("#msg").val();
		$("#msgdialog").dialog({
	         autoOpen:false,
	         modal:true
	      });
		if(msg!="")
		{
			$("#msgdialog").dialog("open");
		}
	});
</script>
</head>
<body>
	<input type="hidden" value="${msg }" id="msg">
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
	<div class="container" style="width:800px;">
	  <form class="form-horizontal" action="serchid.com" method="post">
	    <div class="form-group">
			<label class="control-label col-sm-2" for="id">ID:</label>
            <div class="input-group">
                <input type="text" class="form-control" id="id" placeholder="ID를 입력하십시오." name="id" value="${serchid }" required="required">
                <span class="input-group-btn">
                	<button class="btn btn-success">중복확인<i class="fa fa-mail-forward spaceLeft"></i></button>
                </span>
			</div>
		</div>
	  </form>
	</div>
	<div class="container" style="width:800px;">
	  <form class="form-horizontal" action="signup.com" method="post">
	  	<input type="hidden" name="c_id" value="${serchid }">
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
	        <input type="text" class="form-control" id="name" value="${name }" readonly="readonly" name="c_name" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="age">Age:</label>
	      <div class="col-sm-10">          
	        <input type="date" class="form-control" id="age" name="c_age" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="addr">Addr:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="adrr" name="c_addr" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="tel">Tel:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="tel" placeholder="전화번호를 '-'없이 입력하시오. " name="c_tel" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="email">Email:</label>
	      <div class="col-sm-10">
	        <input type="text" class="form-control" id="email" value="${email }" readonly="readonly" name="c_email" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="gender">Gender:</label>
	      <div class="col-sm-10">
	        <select class="form-control" id="gender" name="c_gender">
			    <option value="남자">남자</option>
			    <option value="여자">여자</option>
			</select>
	      </div>
	    </div>
	    <div class="form-group">        
	      <label class="control-label col-sm-2" for="check">수신 동의:</label>
	      <div class="col-sm-10">
	        <label class="checkbox-inline"><input type="checkbox" value="yes" id="check" name="c_check">예</label>
			<label class="checkbox-inline"><input type="checkbox" value="no" id="check" name="c_check">아니오</label>
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-default">회원가입</button>
	      </div>
	    </div>
	  </form>
	</div>
	<div id="msgdialog">
		<center><font color="red">${msg }</font></center>
	</div>
</body>
</html>