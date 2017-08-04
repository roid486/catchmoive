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
	position: relative; background-color: brown; color: white;
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
		      <tr class="success" id="customer">
		        <td>회원정보</td>
		      </tr>
		      <tr class="danger" id="ticket">
		        <td>예매정보</td>
		      </tr>
		      <tr class="info" id="board">
		        <td>문의정보</td>
		      </tr>
		      <tr class="active" id="cdelete">
		        <td>회원탈퇴</td>
		      </tr>
		    </tbody>
		  </table>
		</div>
	<div id="center" style="width: 70%; margin-left: 20%;">
		<div class="panel panel-info">
	      <div class="panel-heading"><h3>예매내역</h3></div>
	      <div class="panel-body">
				<div class="container">          
				  <table class="table" style="width: 70%;">
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
	      <div class="panel-heading"><h3>History내역</h3></div>
	      <div class="panel-body">
				<div class="container">          
				  <table class="table" style="width: 70%;">
				    <tbody>
				    	<m:forEach var="myh" items="${myh }">
				    		<tr>
						        <td>${myh.m_name }</td>
								<td>${myh.mt_name }</td>
								<td>${myh.t_name }</td>
								<td><fm:formatDate value="${myh.h_ticket_date }" pattern="yyyy/MM/dd"/></td>
								<td>${myh.h_ticket_peoplenum }</td>
								<td>${myh.h_ticket_price }</td>
							</tr>
				    	</m:forEach>
				    </tbody>
				  </table>
				</div>
		  </div>
	    </div>
	</div>
	<br>
	<br>
	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
</body>
</html>