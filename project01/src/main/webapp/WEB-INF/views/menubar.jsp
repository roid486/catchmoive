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
   href="resources/eunseok/fancybox/jquery.fancybox-1.3.4.css?a=2" media="screen" />
<link rel="stylesheet" href="resources/eunseok/style.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
   #logo{
      padding: 20px;
   }
   .menu-bar{
      text-align: center;
      background-color: skyblue;
      cursor: pointer;
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
	.zeta-menu li:hover { background: pink; }
	.zeta-menu li.expand { background: white; }
	.zeta-menu li.expand>a { color: hotpink; }
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
	.zeta-menu ul li.expand { background: #ddd; }
	.zeta-menu ul li.expand a { color: black; }
	.zeta-menu ul a { color: black; }
	.zeta-menu ul ul { left: 100%; top: 0; }
   
   .topmenu{
      text-align: right;
      cursor: pointer;
      font-family: -윤고딕340;
   }
   #login:HOVER{
      color: hotpink;
   }
   #signup:HOVER{
      color: hotpink;
   }
   .logout:HOVER{
      color: hotpink;
   }
   #masterpage:HOVER{
      color: hotpink;
   }
   #mypage:HOVER{
      color: hotpink;
   }
   #scid{
   		cursor: pointer;
   }
   #scpw{
   		cursor: pointer;
   }
.whateverYouChooseforWrapCSS .fancybox-skin {
  background: none;
}
  
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
var jq3= jQuery.noConflict();
</script>
<script type="text/javascript" src="resources/eunseok/jquery-migrate-1.4.1.min.js"></script>
<script type="text/javascript">
var jq1= jQuery.noConflict();
</script>
<script type="text/javascript"
   src="resources/eunseok/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript"
   src="resources/eunseok/fancybox/jquery.fancybox-1.3.4_patch.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
jq1(function($) {
   $("a[rel=fancybox]").fancybox({
      width : 1000,
      height : 600,
      showCloseButton : true,
      opcity : 0.2,
      overlayShow : true,
      scrolling : "no",
      overlayColor:"#000000",
      overlayOpacity:0.5
   });
}) 
 jq3(function ($) {
	 $(document).mouseup(function(e) {
			if ($(e.target).parents('.zeta-menu').length == 0) {
				$('.zeta-menu li').removeClass('expand');
				$('.zeta-menu ul').hide();
			}
		});
		$(".zeta-menu>li:has(ul)>a").each( function() {
			$(this).html( $(this).html()+' &or;' );
		});
		$(".zeta-menu ul li:has(ul)")
			.find("a:first")
			.append("<p style='float:right;margin:-3px'>&#9656;</p>");

		$(".zeta-menu li>a").click(function(){
			var li = $(this).parent();
			var ul = li.parent()
			ul.find('li').removeClass('expand');
			ul.find('ul').not(li.find('ul')).hide();
			li.children('ul').toggle();
			if( li.children('ul').is(':visible') || li.has('ul')) {
				li.addClass('expand');
			}
		});
		
      $("#logindial").dialog({
         autoOpen:false,
         modal:true
      });
      $("#errordial").dialog({
         autoOpen:false,
         modal:true
      });
      $("#emsgdial").dialog({
         autoOpen:false,
         modal:true
      });
      $("#sciddial").dialog({
         autoOpen:false,
         modal:true
      });
      $("#scpwdial").dialog({
         autoOpen:false,
         modal:true
      });
      
      $("#login").click(function () {
         $("#logindial").dialog("open");
      });
      $("#scid").click(function () {
         $("#logindial").dialog("close");
         $("#sciddial").dialog("open");
      });
      $("#scpw").click(function () {
         $("#logindial").dialog("close");
         $("#scpwdial").dialog("open");
      });
      
      
      var signupnum = $("#signupnum").val();
      if(signupnum == 2)
      {
         $("#errordial").dialog("open");
      }
      
      $("#signup").click(function () {
         location.href="signup.com";
      });

      $("#listboard").click(function () {
         location.href="listBoard.com";
      });
 
      $("#masterpage").click(function () {
         location.href="masterpage.com";
      });
      
      $(".logout").click(function () {
    	  location.href="logout.com";
      });
      
      var loginid = $("#loginid").val();
      $("#logindiv").hide();
      $("#masterdiv").hide();
      
      if(loginid=="master")
      {
    	    $("#masterdiv").show();
    	    $("#unlogindiv").hide();
    	    $("#logindiv").hide();
      }
      else if(loginid!=null && loginid!="")
      {
    	  $("#logindiv").show();
  	      $("#unlogindiv").hide();
  	      $("#masterdiv").hide();
      }
      else if(loginid==null && loginid=="")
      {
    	  $("#unlogindiv").show();
  	      $("#masterdiv").hide();
  	      $("#logindiv").hide();
      }
      
      var ere = $("#ere").val();
      if(ere==1)
      {
    	  $("#emsgdial").dialog("open");
      }
      
   })
</script>
</head>
<body>
   <input type="hidden" id="signupnum" value="${signupnum }">
   <input type="hidden" id="ere" value="${ere }">
   <input type="hidden" id="loginid" value="${se_id }">
   <div class="topmenu">
   	  <div id="unlogindiv">
	      <span id="login">로그인</span>/<span id="signup">회원가입</span>
   	  </div>
   	  <div id="logindiv">
	      <span id="mypage">MyPage</span>/<span class="logout">로그아웃</span>
   	  </div>
   	  <div id="masterdiv">
	      <span id="masterpage">MasterPage</span>/<span class="logout">로그아웃</span>
   	  </div>
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
                    <li><a href="listMovie.com">영화 정보</a></li>
                      <li><a href="movieFinder.com">무비 파인더</a></li>
                  </ul>
             </li>
             <li><a rel="fancybox" class="iframe" href="fancy_sub1.com">예매</a></li> 
             <li><a id="movietheater">영화관</a>
                <ul>
                   <m:forEach var="mtl" items="${mtlist }">
                    <li><a href="#">${mtl.mt_name }</a></li>
                   </m:forEach>
               </ul>
             </li> 
             <li><a href="#">이벤트</a></li> 
             <li><a id="listboard">공지사항</a></li> 
         </ul>
      </div>
   </div>
   <div id="logindial" title="로그인">
      <center>
         <form action="login.com" method="post">
            <table align="center">
               <tr>
                  <td>
                     <input type="text" name="c_id" placeholder="ID"><br>
                     <input type="password" name="c_pw" placeholder="PASSWORD">
                  </td>
                  <td>
                     <input type="submit" value="로그인">
                  </td>
               </tr>
               <tr>
                  <td><span id="scid">아이디</span>/<span id="scpw">비밀번호</span> 찾기</td>
               </tr>
            </table>
         </form>
      </center>
   </div>
   <div id="sciddial" title="아이디찾기">
      <center>
         <form action="scid.com" method="post">
            <table align="center">
               <tr>
                  <td>
                     <input type="text" name="name" placeholder="이름"><br>
                     <input type="text" name="email" placeholder="Email">
                  </td>
                  <td>
                     <input type="submit" value="찾기">
                  </td>
               </tr>
            </table>
         </form>
      </center>
   </div>
   <div id="scpwdial" title="비밀번호찾기">
      <center>
         <form action="scpw.com" method="post">
            <table align="center">
               <tr>
                  <td>
                     <input type="text" name="id" placeholder="ID"><br>
                     <input type="text" name="name" placeholder="이름"><br>
                     <input type="text" name="email" placeholder="Email">
                  </td>
                  <td>
                     <input type="submit" value="찾기">
                  </td>
               </tr>
            </table>
         </form>
      </center>
   </div>
   <div id="errordial" title="오류">
      <center><span>존재하지 않는 아이디/비밀번호 입니다.</span></center>
   </div>
   <div id="emsgdial" title="오류">
      <center><span>${emsg }</span></center>
   </div>
</body>
</html>