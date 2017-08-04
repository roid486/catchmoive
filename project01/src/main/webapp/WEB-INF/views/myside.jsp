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
	#myside{
		position: absolute; left: 0px; cursor: pointer;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function () {
		$("#total").click(function () {
			location.href="mypage.com";
		});
		$("#customer").click(function () {
			alert("hi");
			/* location.href="mlist.com"; */
		});
		$("#ticket").click(function () {
			alert("hi");
			/* location.href="mtlist.com"; */
		});
		$("#board").click(function () {
			alert("hi");
			/* location.href="tlist.com"; */
		});
		$("#cdelete").click(function () {
			alert("hi");
			/* location.href="rlist.com"; */
		});
	});
</script>
</head>
<body>
	<div id="mside" class="container" style="width:20%;">
	  <table class="table">
	    <thead>
	      <tr>
	        <th>MyMenu</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr id="total">
	        <td>종합정보</td>
	      </tr>      
	      <tr class="success" id="customer">
	        <td>회원정보</td>
	      </tr>
	      <tr class="danger" id="ticket">
	        <td>예매정보</td>
	      </tr>
	      <tr class="info" id="board">
	        <td>문의정보</td>
	      </tr>
	      <tr class="info" id="cdelete">
	        <td>회원탈퇴</td>
	      </tr>
	    </tbody>
	  </table>
	</div>
</body>
</html>