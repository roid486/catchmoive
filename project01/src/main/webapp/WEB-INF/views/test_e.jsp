<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#menu {
		position: relative;
		z-index: 999;
	}
	#bottom {
	position: relative;   background-color:  #e6f3ff; color: black;
	}
</style>
</head>
<body>

	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
	<div id="msi">
		<jsp:include page="/WEB-INF/views/mside.jsp"></jsp:include>
	</div>
	<div class="container" id="clist" style="width: 70%; margin-right: 10%;">
		<div class="panel panel-info">
	      <div class="panel-heading"><h3>총 매출</h3></div>
	      <div class="panel-body">
				<h4>${totalprice }</h4>
		  </div>
	    </div>
		<div class="panel panel-info">
	      <div class="panel-heading"><h3>일별 매출</h3></div>
	      <div class="panel-body">
				<img src= "resources/rfile/${fname }">
		  </div>
	    </div>
		<div class="panel panel-info">
	      <div class="panel-heading"><h3>영화별 매출</h3></div>
	      <div class="panel-body">
				<div class="container">          
				  <table class="table" style="width: 70%;">
				    <tbody>
				    	<m:forEach var="mp" items="${mprice }">
				    		<tr>
						        <td>${mp.m_name }</td>
						        <td>${mp.m_price }</td>
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