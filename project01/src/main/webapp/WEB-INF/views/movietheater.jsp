<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mts" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	div{
		border: 1 solid black;
	}
	#menu{
		position: relative;
		z-index: 999;
	}
	#center {
	position: relative;
	display: inline-block;
	width: 100%;
	}
	#mside{
		position: relative;
		display: inline-block;
		width: 20%;
	}
	.mt_num{
		cursor: pointer;
	}
	#movietheaterdetail{
		position: relative;
		z-index: 1;
		display: inline-block;
		width: 75%;
	}
	#theaterl{
		width: 100%;
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
		$(".mt_num").click(function () {
			var idx = $(this).attr("idx");
			location.href="movietheater.com?mt_number="+idx;
		});
		$(".tlist").click(function () {
			var tnum = $(this).val();
			
			$.ajax({
				url : "theaterlist.com",
				success : function(data) {
					$.each(JSON.parse(data), function(idx, item) {
						
					});
				}
			});	
			
		});
	});
</script>
</head>
<body>
	<input type="hidden" id="re" value="${re }">
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
	<div id="center">
			<div id="mside" class="container" >
			  <table class="table">
			    <thead>
			      <tr>
			        <th>영화관 메뉴</th>
			      </tr>
			    </thead>
			    <tbody>
			    	<mts:forEach var="mtsd" items="${mtl }">
				      <tr id="customer">
				        <%-- <td><a href="movietheater.com?mt_number=${mtsd.mt_number }">${mtsd.mt_name }</a></td> --%>
				        <td><label class="mt_num" idx="${mtsd.mt_number }">${mtsd.mt_name }</label></td>
				      </tr>	    	
			    	</mts:forEach>
			    </tbody>
			  </table>
			</div>
		<div class="container" id="movietheaterdetail">
		  <h2>${mtd.mt_name }</h2>
		  <img src="resources/mt_img/${mtd.mt_img }" class="img-rounded" alt="Cinque Terre" width="100%" height="200"><br>
		  
		  <div class="container" id="theaterl">
			  <h2>${mtd.mt_name }상영관</h2>
			  <div class="btn-group btn-group-justified">
			  	<mts:forEach var="tl" items="${theaterlist }">
			  		<div class="btn-group">
				      <button type="button" class="btn btn-primary tlist" value="${tl.t_number }">${tl.t_name }</button>
				    </div>
			  	</mts:forEach>
			  </div>
			</div>
			
			<div id="runninglist">
				
			</div>
			
		</div>
	</div>
</body>
</html>