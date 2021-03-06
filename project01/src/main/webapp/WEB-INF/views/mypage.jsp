<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	#menu{
		position: relative;
		z-index: 999;
	}
	#myside{
		position: absolute;
		left: 0px;
		display: inline-block;
		width: 20%;
		height: 100%;
		cursor: pointer;
	}
	#center{
		position: relative;
		z-index: 1;
		display: inline-block;
		width: 60%;
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
		var id = $("#loginid").val();
		$("#total").click(function () {
			location.href="mypage.com?c_id="+id;
		});
		$("#customer").click(function () {
			location.href="mycupdate.com?c_id="+id;
		});
		$("#ticket").click(function () {
			location.href="myticket.com?c_id="+id;
		});
		$("#board").click(function () {
			location.href="myboard.com?c_id="+id;
		});
		$("#cdelete").click(function () {
			location.href="mycdelete.com?c_id="+id;
		});
	});
</script>
</head>
<body>
	<input type="hidden" id="loginid" value="${se_id }">
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
		<div id="myside" class="container" style="width:20%;">
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
		      <m:if test="${navernum==1 }">
			      <tr class="success" id="customer">
			        <td>회원정보</td>
			      </tr>
		      </m:if>  
		      <tr class="danger" id="ticket">
		        <td>예매정보</td>
		      </tr>
		      <tr class="info" id="board">
		        <td>문의정보</td>
		      </tr>
		      <m:if test="${navernum==1 }">
			      <tr class="active" id="cdelete">
			        <td>회원탈퇴</td>
			      </tr>
		      </m:if>
		    </tbody>
		  </table>
		</div>
	<div id="center" style="width: 70%; margin-left: 20%;">
		<div class="panel panel-info">
	      <div class="panel-heading"><h3>예매내역</h3></div>
	      <div class="panel-body">
				<div class="container">          
				  <table class="table" style="width: 70%;">
				  	<thead>
				      <tr>
				        <th>티켓번호</th>
				        <th>영화</th>
				        <th>영화관</th>
				        <th>상영관</th>
				        <th>상영날짜</th>
				        <th>상영시간</th>
				        <th>상영 인원</th>
				        <th>가격</th>
				      </tr>
				    </thead>
				    <tbody>
				    	<m:forEach var="myt" items="${myt }">
				    		<tr>
						        <td>${myt.ticket_number }</td>
						        <td>${myt.m_name }</td>
								<td>${myt.mt_name }</td>
								<td>${myt.t_name }</td>
								<td><fm:formatDate value="${myt.ticket_date }" pattern="yyyy/MM/dd"/></td>
								<td>${myt.r_start }</td>
								<td>${myt.ticket_peoplenum }</td>
								<td>${myt.ticket_price }</td>
							</tr>
				    	</m:forEach>
				    </tbody>
				  </table>
				</div>
		  </div>
	    </div>
	    <div class="panel panel-danger">
	      <div class="panel-heading"><h3>나의 문의</h3></div>
	      <div class="panel-body">
				<div class="container">          
				  <table class="table" style="width: 70%;">
				  	<thead>
				      <tr>
				        <th>문의</th>
				        <th>제목</th>
				        <th>날짜</th>
				        <th>작성자</th>
				      </tr>
				    </thead>
				    <tbody>
				    	<m:forEach var="mybl" items="${myb }">
				    		<tr>
						        <td>${mybl.b_type }</td>
						        <td>${mybl.b_title }</td>
						        <td>${mybl.b_regdate }</td>
						        <td>${mybl.c_name }</td>
							</tr>
				    	</m:forEach>
				    </tbody>
				  </table>
				</div>
		  </div>
	    </div>
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