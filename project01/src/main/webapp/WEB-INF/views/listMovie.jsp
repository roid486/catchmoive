<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캐치무비 >> 무비차트</title>
<style type="text/css">
#s{
	float: right;
	position: relative;
	right: 190px;
}

#menu{
 background-color: #80d4ff;

}

#w3-bar-item{
font-family: -윤고딕340;
}

#di_index{
	width: 220px;
	height: 20;
	background-color: red;
	border-color: black;
	border-style:solid;
	text-align:center;
	font-size: 16pt;
	color: white;
	
}

#div_name{
	text-align: center;
	font-size: 12pt;
	color:black;
	cursor: pointer;
}

#side_lab{
	color: #666666;
}

/* #di_index2{
	width: 220px;
	height: 30;
	background-color: #1B7499;
	border-color: black;
	border-style:solid;
	text-align:center;
	font-size: 18pt;
	color: white;
	
} */
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){

	$("#btn_go").click(function(){
		var data = $("#select_sort option:selected").val();
		
		if(data){
			location.href="listMovie.com?select="+data;
		}
		
		
	});
	
});


</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
 <h2><strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;무비 차트</strong></h2>
  <br>
  <hr>
  <br>
 
 
	
	<!-- Sidebar -->
<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:15%" id="menu">
  <h3 class="w3-bar-item" id="w3-bar-item">영화</h3>
  <a href="#" class="w3-bar-item w3-button">무비차트</a>
  <a href="#" class="w3-bar-item w3-button">무비파인더</a>
  
</div>

<!-- Page Content -->
<div style="margin-left:20%">

<center>

	<span id="s">
		<select id="select_sort">
			<option value="m_boxoffice">예매율순</option>
			<option value="m_score">평점순</option>
		</select>
		<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large" id="btn_go">go</button>
	</span>
<table cellspacing="5">
 	<tr>
    		<c:forEach var="l" items="${l }" varStatus="status">
         	<td style="padding-right: 40px; padding-bottom: 30px; padding-left: 40px; padding-top: 30px">
				
				<div id="di_index"> 
					<label>No.${status.index+1 }</label>
					
				</div>
				
				
				<a href="detailMovie.com?m_number=${l.m_number }">
				
				<img src="resources/upload/${l.m_image }" width="220" height="320"><br></a>
				
				<a href="detailMovie.com?m_number=${l.m_number }">
				<div style="text-align: center; font-size: 12pt;">
				
				<strong><label id="div_name" >${l.m_name }</label></strong></a></div>
				
				<div>
				<center>
				<label id="side_lab"><f:formatDate value="${l.m_opendate }" pattern="yyyy.MM.dd"></f:formatDate> 개봉&nbsp;|&nbsp;예매율:&nbsp;${l.m_boxoffice }%</label>
				</center>
				</div>
			</td>
                     
               <c:if test="${(status.index+1) % 3 ==0 }">
               	</tr><tr>
               </c:if>
            </c:forEach> 
   		 </tr>
    
    </table></center>
    <br>
    <%-- <center><strong>${pageStr }</strong></center> --%>




</div>

	
	
 
   
    
    
    

</body>
</html>