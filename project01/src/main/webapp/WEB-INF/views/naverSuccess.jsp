<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
html, div, body, h3 {
	margin: 0;
	padding: 0;
}
h3 {
	display: inline-block;
	padding: 0.6em;
}
</style>
<script type="text/javascript">
	$(function(){
		var name = ${result}.response.name;
		var email = ${result}.response.email;
		var success = "${SuccessInsert}";
	
		
		if(success!=""){
			//alert("새 멤버 환영해!");
			$("#name").html(name+"님!\n 캐치무비 가입을 환영합니다.");
			$("#email").html("가입 아이디 : "+email);
			$("#closeBtn").click(function(){
				 window.opener.document.location.href="main.com";
					self.opener = self;
					self.close();
			});
			
		}
		else{
			//alert("로그인했네?");
			
			 window.opener.document.location.href="main.com";
			self.opener = self;
			self.close();
			
		} 
	
	});
</script>

</head>
<body>
	<div
		style="background-color:skyblue; width: 100%; height: 50px; text-align: center; color: white;">
		<h3><strong>캐치무비 네이버로 로그인 성공</strong></h3>
	</div><br><p></p><br>
	<br>
	<center><img src="resources/images/catchmovieLogo.png" width="50%" height="150px"></center>
	<br><p></p>
	<h2 style="text-align: center" id="name"></h2><br>
	<strong><h4 style="text-align: center" id="email"></h4></strong><br><p></p><br>
	<center><button type="button" id="closeBtn" class="btn btn-info">&nbsp;닫기&nbsp;</button></center>
	

</body>
</html>