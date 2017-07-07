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
	*{
		list-style: none; margin: 0px; padding: 0px; 
	}
	#logo{
		padding: 20px;
	}
	#mainmenu{
		position: relative; background-color: skyblue; margin: 0px; padding: 10px; width: 100%; height: 10%; text-align: center; cursor: pointer;
	}
	.menu{
		display: inline; padding: 0 5%; cursor: pointer;
	}
	#drop{
		position: absolute; left: 20%; background-color: skyblue; cursor: pointer;
	}
	#mtdrop{
		position: absolute; left: 47%; background-color: skyblue; cursor: pointer;
	}
	.a{
		 display: block; cursor: pointer;
	}
	#topmenu{
		text-align: right;
		cursor: pointer;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function () {
		$("#drop").hide();
		$("#mtdrop").hide();
		$("#movie").hover(function () {
			$("#drop").show().addClass("a");
		}, function () {
			$("#drop").hide().removeClass("a");
		});
		$("#movietheater").hover(function () {
			$("#mtdrop").show().addClass("a");
		}, function () {
			$("#mtdrop").hide().removeClass("a");
		});
		$(".moviemenu").click(function () {
			alert($(this).html());
		});
		$(".mtmenu").click(function () {
			alert($(this).html());
		});
		$("#logindial").dialog({
			autoOpen:false,
			modal:true
		});
		$("#login").click(function () {
			$("#logindial").dialog("open");
		});
		$("#signupdial").dialog({
			autoOpen:false,
			modal:true
		});
		$("#signup").click(function () {
			$("#signupdial").dialog("open");
		});
		var signupnum = $("#signupnum").val();
		if(signupnum == 2)
		{
			alert("회원가입을 확인하십시오");
		}
	});
</script>
</head>
<body>
	<input type="hidden" id="signupnum" value="${signupnum }">
	<m:if test="${!empty loginid }">
		${loginid }
	</m:if>
	<div id="topmenu">
		<span id="login">로그인</span>/<span id="signup">회원가입</span>
	</div>
	<div id="logo">
		<center>
			<a href="main.com"><img src="resources/logo/Mainlogo02.png" width="300" height="120"></a>
		</center>
	</div>
	<div id="mainmenu">
			<ul>
				<li id="movie" class="menu">
					영화
					<ul id="drop">
						<li class="moviemenu">영화 정보</li>
						<li class="moviemenu">무비 파인더</li>
					</ul>
				</li>
				<li id="ticket" class="menu">예매</li>
				<li id="movietheater" class="menu">
					영화
					<ul id="mtdrop">
						<m:forEach var="mtl" items="${mtlist }">
							<li class="mtmenu">${mtl.movietheater_name }</li>
						</m:forEach>
					</ul>
				</li>
				<li id="event" class="menu">이벤트</li>
				<li id="notis" class="menu">고객센터</li>
			</ul>
	</div>
	<div id="logindial" title="로그인">
		<center>
			<form action="login.com">
				<table align="center">
					<tr>
						<td>
							<input type="text" name="customer_id" placeholder="ID"><br>
							<input type="password" name="customer_pw" placeholder="PASSWORD">
						</td>
						<td>
							<input type="submit" value="로그인">
						</td>
					</tr>
					<tr>
						<td><span id="serchid">아이디</span>/<span id="serchpw">비밀번호</span>찾기</td>
					</tr>
				</table>
			</form>
		</center>
	</div>
	<div id="signupdial" title="회원가입">
		<center>
			<form action="signup.com">
				<table align="center">
					<tr>
						<td>
							<center>
								<input type="text" name="customer_id" placeholder="아이디"><br>
								<input type="password" name="customer_pw" placeholder="비밀번호를 8자리 이상 적어주세요"><br>
								<input type="text" name="customer_name" placeholder="이름"><br>
								<input type="text" name="customer_addr" placeholder="주소"><br>
								<input type="text" name="customer_tel" placeholder="-없이 적어주세요"><br>
								<input type="text" name="customer_email" placeholder="이메일"><br>
								<select name="customer_gender">
									<option value="남자">남자</option>
									<option value="여자">여자</option>
								</select><br>
								<input type="submit" value="회원가입">
							</center>
						</td>
					</tr>
				</table>
			</form>
		</center>
	</div>
</body>
</html>