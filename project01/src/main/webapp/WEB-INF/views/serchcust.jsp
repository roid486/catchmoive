<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/ui/jquery-ui.min.css">
<link rel="stylesheet" href="resources/ui/jquery-ui.structure.min.css">
<link rel="stylesheet" href="resources/ui/jquery-ui.theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	#menu{
		position: relative;
		z-index: 999;
	}
</style>
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
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
	<div>
		<center>
			환영합니다.<br> 
			Catch Movie는 1인 1계정을 원칙으로 합니다.<br>
			이미 가입되신분은 회원가입이 불가능합니다. <br>
			회원은 아이디/비밀번호 찾기를 하시기 바랍니다.<br>
			<br>
			<br>
			<div class="container" style="width: 800px;">
			  <form class="form-horizontal" action="serchcust.com" method="post">
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="name">이름:</label>
			      <div class="col-sm-10">
			        <input style="width: 50%;" type="text" class="form-control" id="name" placeholder="실명을 기입하시오." name="name" required="required">
			      </div>
			    </div>
			    <div class="form-group" style="width: 800px;">
	              <label class="control-label col-sm-2" for="email">Email:</label>
	              <div class="input-group">
	                <input type="text" class="form-control" id="email" placeholder="email을 입력하십시오." name="front_email" required="required">
	                <span class="input-group-btn" style="width: 50%;">
	                  <select class="form-control" id="email" name="back_email">
					    <option value="@naver.com">@naver.com</option>
					    <option value="@hanmail.com">@hanmail.net</option>
					    <option value="@gmail.com">@gmail.com</option>
					  </select>
	                </span>
	              </div>
	            </div>
			    <div class="form-group">        
			      <div class="col-sm-offset-2 col-sm-10">
			        <button type="submit" class="btn btn-default">검색</button>
			      </div>
			    </div>
			  </form>
			</div>
		</center>
	</div>
	<input type="hidden" id="msg" value="${msg }">
	<div id="msgdialog">
		<center><font color="red">${msg }</font></center>
	</div>
</body>
</html>