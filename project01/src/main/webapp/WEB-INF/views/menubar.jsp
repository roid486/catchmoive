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
<link rel="stylesheet" type="text/css"
	href="resources/eunseok/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" href="resources/eunseok/style.css" />

<style type="text/css">
	*{
		list-style: none; margin: 0px; padding: 0px; font-family: -윤고딕340;
	}
	#logo{
		padding: 20px;
	}
	.menu-bar{
		text-align: center;
		background-color: skyblue;
	}
	.zeta-menu-bar {
	  background: skyblue;
	  display: inline-block;
	  width: 40%;
	}
	.zeta-menu { margin: 0; padding: 0; }
	.zeta-menu li {
	  float: left;
	  list-style:none;
	  position: relative;
	}
	.zeta-menu li:hover { background: white; }
	.zeta-menu li:hover>a { color: skyblue; }
	.zeta-menu a {
	  color: white;
	  display: block;
	  padding: 10px 20px;
	  text-decoration: none;
	}
	.zeta-menu ul {
	  background: #eee;
	  border: 1px solid silver;
	  display: none;
	  padding: 0;
	  position: absolute;
	  left: 0;
	  top: 100%;
	  width: 180px;
	}
	.zeta-menu ul li { float: none; }
	.zeta-menu ul li:hover { background: #ddd; }
	.zeta-menu ul li:hover a { color: black; }
	.zeta-menu ul a { color: black; }
	.zeta-menu ul ul { left: 100%; top: 0; }
	.zeta-menu ul ul li {float:left; margin-right:10px;}
	#topmenu{
		text-align: right;
		cursor: pointer;
		font-family: 새굴림;
	}
	#login:HOVER{
		color: hotpink;
	}
	#signup:HOVER{
		color: hotpink;
	}
</style>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.4.3.min.js"></script>
<script type="text/javascript"
	src="resources/eunseok/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript"
	src="resources/eunseok/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript">
	$(function () {

		$(".zeta-menu li").hover(function(){
			$('ul:first',this).show();
		  }, function(){
		    $('ul:first',this).hide();
		  });
		$(".zeta-menu>li:has(ul)>a").each( function() {
			$(this).html( $(this).html()+' &or;' );
		  });
		$(".zeta-menu ul li:has(ul)").find("a:first").append("<p style='float:right;margin:-3px'>&#9656;</p>");
		$("#logindial").hide();
		$("#logindial").dialog({
			autoOpen:false,
			modal:true
		});
		$("#login").click(function () {
			$("#logindial").show();
			$("#logindial").dialog("open");
		});
		
		var signupnum = $("#signupnum").val();
		if(signupnum == 2)
		{
			alert("회원가입을 확인하십시오");
		}
		$("#signup").click(function () {
			location.href="signup.com";
		});
		
		
		$("a[rel=fancybox]").fancybox({
			width : 1000,
			height : 600,
			showCloseButton : false
		});
	
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
	<div class="menu-bar">
		<div class='zeta-menu-bar'>
			<ul class="zeta-menu">
			    <li><a href="#">영화</a>
			    	<ul>
			        	<li><a href="#">영화 정보</a></li>
			       		<li><a href="#">무비 파인더</a></li>
			      	</ul>
			    </li>
			    <li><a rel="fancybox" class="iframe" href="fancy_sub1.com">예매</a></li> 
			    <li><a href="#">영화관</a>
			    	<ul>
			    		<m:forEach var="mtl" items="${mtlist }">
				        <li><a href="#">${mtl.movietheater_name }</a></li>
			    		</m:forEach>
					</ul>
			    </li> 
			    <li><a href="#">이벤트</a></li> 
			    <li><a href="#">공지사항</a></li> 
			</ul>
		</div>
	</div>
	<div id="logindial" title="로그인">
		<center>
			<form action="login.com" method="post">
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
</body>
</html>