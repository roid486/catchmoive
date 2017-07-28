<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<style type="text/css">
.end{
 	border-radius: 5px;
	border: 2px solid gray;
	color: gray;
}
.ing{
	border-radius: 5px;
	border: 2px solid blue;
	color: blue;
}
.pre{
	border-radius: 5px;
	border: 2px solid red;
	color: red;
}
#well{
 background: #DFF6FF;
 vertical-align: middle;
}

#comment{

}


#counter {
  /* background:rgba(255,0,0,0.5); */
  border-radius: 0.5em;
  padding: 0 .5em 0 .5em;
  font-size: 10pt;
  position: absolute;

  
}

#cnt{
position:relative;
top:-20px;
left:-340px;
float: right;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" href="rating/jquery.raty.css">
<script type="text/javascript" src="rating/jquery.raty.js"></script>
  <script type="text/javascript">
  	$(function(){
  		var showing = $("#lab_showing").text();
  		
  		if(showing==0){
  			$("#lab_showing").text("상영 종료").addClass("end");
  		}
  		else if(showing==1){
  			$("#lab_showing").text("상영중").addClass("ing");
  		}
  		else if(showing==2){
  			$("#lab_showing").text("상영 예정").addClass("pre");
  		}
  		
  		$("#div_rating").raty({
  			targetKeep : true,
  			 target:"#score_lab",
  			 starOn: "resources/images/star-on.png",
  			 starOff: "resources/images/star-off.png"
  		}); 
  		
  		
  		$("#comment").keyup(function(){
  			var inputLength = $(this).val().length;
  			var remain = 100-inputLength;
  			
  			$("#counter").text(remain);
  			
  			if(remain>=0){
  				$("#counter").css("color","black");
  				if(remain==0){
  					
  				}
  			}else{
  				$("#counter").css("color","red");
  			}
  			
  		});
  		
  		
  		/* 등록 버튼 누르면 댓글 등록되게하기 ! 비로그인시 -> 로그인 유도 팝업창 
  									로그인되있을시 -> moviescore insert하기!  */
  		$("#btn_register").click(function(){
  			var currentScore = $('#div_rating').raty('score'); //별점
  			var cheklog = $("#loginid").val(); //로그인 아이디
  			var ms_mid = $("#ms_mid").val();
  			
  			$("#star").val(currentScore);
  			$("#logId").val(cheklog);
  			
  			
  			
  			if(cheklog == null || cheklog==""){
  				alert("로그인안됐어!");
  			}
  			else{
  				//alert("로그인했네?");
  				var params =$("#formId").serialize();
  				$.ajax({
  					//url:"detailMovie.com?m_number='"+ms_mid+"'",/* "insertMovieScore.com", */
  					url:"insertMovieScore.com",/* "insertMovieScore.com", */
  					/* type: "post", */
  					data:params,
  					success:function(data){ 
  						alert(data);
  					}
  				});
  				//$("#formId").attr("action","insertMovieScore.com");
  				
  			}
  			
  		});
  		
  		
  		
  		
  	});
  	
  	
  </script>
   
    <title id="movie_title">${m.m_name }&lt;영화상세 &lt; 영화 | 캐치무비</title>
    

</head>
<body>
<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
    <p>
    <div class="col-md-2" style="float:left;"> <h2 align="left"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;영화상세</strong></h2></div>
 
    <div class="col-md-1" style="float:left;"> <a href="updateMovie.com?m_number=${m.m_number }"><button type="button" class="btn btn-primary" >수정</button></a> </div>
	
    </p>
    </div>
	</div>


<hr>
<div class="container">

 
<div class="row">
	<div class="col-md-3">
	 <a href="resources/upload/${m.m_image }" title="포스터 크게 보기 새창" target="_blank">
	<img alt="${m.m_name } 새창" src="resources/upload/${m.m_image }" width="220" height="340" style="display: block;">포스터 크게 보기
	</a>
	</div>
	<div style="float: left;">
		<div>
		<h3><strong>${m.m_name }</strong></h3>
		<label id="lab_showing">${m.m_isshowing }</label>
		</div>
		<br>
		<label><b>감독 : ${m.m_director } / </b></label>
		<label><b>주연 배우 :${m.m_actor }</b></label><br>
		<label><b>장르 : ${m.m_genre }</b></label>&nbsp;&nbsp;/&nbsp;&nbsp;
		<label><b>기본 :&nbsp; ${m.m_grade },&nbsp; ${m.m_runningtime }분,
		&nbsp;${m.m_nation }</b></label><br>
		<label><b>개봉 :&nbsp; <f:formatDate value="${m.m_opendate }" pattern="yyyy/MM/dd"></f:formatDate></b></label><br>
		<br>
			<%-- <label>${m.movie_synop }</label> --%>
	</div>
</div>
<br><br><br>
<hr>
<div class="row">
	 <div class="col-md-10" style="line-height: 3.0em">
		<label>${m.m_synop }</label>
	
	</div> 

</div>

<br><br>


  
 <div class="container">
 <div class="well well-sm" id="well"><h4><strong>스틸 이미지</strong></h4>  <br></div>
    
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="resources/upload/${m.m_image1 }" alt="${m.m_image1 }" style="width:100%; height:500px; ">
      </div>

      <div class="item">
        <img src="resources/upload/${m.m_image2 }"  alt="${m.m_image2 }" style="width:100%;height:500px;">
      </div>
    
      <div class="item">
        <img src="resources/upload/${m.m_image3 }" alt="${m.m_image3 }" style="width:100%;height:500px;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br><br><br>
<div>
<div class="well well-sm" id="well"><h4><strong>메인 예고편</strong></h4>  <br></div>
	
	<iframe src="${m.m_trailer }" height="550" width="100%" style="border:none;"></iframe>

</div>
<br><br><br>
<div class="well well-sm" id="well"><h4><strong>평점 주기</strong> </h4></div>
 
 
<div>
<span id="cnt">
<div id="counter"> </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>/100</label>
</span>
</div>

<div id="div_rating" style=" float:left; width: 20%;">
 	<div class="media-left media-top" style="float: left;">
      <img src="resources/images/user.png" class="media-object" style="width:50px">
    </div>
	<div id="score_lab" ></div>
</div>
<span>
<form id="formId">
    <div class="form-group" >
		<span class="" style="float: left; ">
		<input type="hidden" name="ms_mid" value="${m.m_number }">
		<input id="star" type="hidden" name="ms_score">
		<input id="logId" type="hidden" name="ms_custid">
      <textarea maxlength="100" class="form-control col-sm-4" rows="3" id="comment" name="ms_comment" placeholder="로그인한 회원만 이용 가능합니다." style="width:580px;"></textarea>
     
      <button type="submit" id="btn_register" class="btn btn-default btn-lg" style="height: 60px"><strong>등록</strong></button></span>
    </div>
  </form>

</span>


<div></div> <!-- moviescore select 해올 부분 (댓글달린거 보여주려고) -->

<br><br><br>




</body>
</html>