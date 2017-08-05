<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.icon_grade{
	position: relative;
	bottom: -20px;
	left: -10px;
}
.revise{
	cursor: pointer;
}
.delete{
	cursor: pointer;
}



</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<!-- <link rel="stylesheet" href="rating/modal.min.css"> -->
<link rel="stylesheet" href="rating/jquery.raty.css">
<script type="text/javascript" src="rating/jquery.raty.js"></script>
<!-- <script type="text/javascript" src="rating/modal.min.js"></script> -->
  <script type="text/javascript">
  	$(function(){
  		var showing = $("#lab_showing").text();
  		var ms_mid = $("#ms_mid").val();
  		var m_grade = $("#m_grade").text();
  		var cheklog = $("#loginid").val(); //로그인 아이디
  	
  		
  		
  		$("#img_grade").empty();
  		if(m_grade=="12세 관람가"){
  			var img = $("<img/>").attr({"src":"resources/images/movie_play_level_12.png",
  				"width":"20px","height":"20px"}).addClass("icon_grade");
 				$(img).appendTo("#img_grade");
  			}
  		
  		else if(m_grade=="15세 관람가"){
  			var img = $("<img/>").attr({"src":"resources/images/movie_play_level_15.png",
  				"width":"20px","height":"20px"}).addClass("icon_grade");
 				$(img).appendTo("#img_grade");
  			}
  		else if(m_grade=="전체 관람가"){
  			var img = $("<img/>").attr({"src":"resources/images/movie_play_level_all.png",
  				"width":"20px","height":"20px"}).addClass("icon_grade");
 				$(img).appendTo("#img_grade");
  			}
  		else if(m_grade=="청소년 관람불가"){
  			var img = $("<img/>").attr({"src":"resources/images/movie_play_level_18.png",
  				"width":"25px","height":"25px"}).addClass("icon_grade");
 				$(img).appendTo("#img_grade");
  		}
  		
  		
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
  		
  		$("#paging").click(function(){
  			alert("페이징 클릭했네~?");
  		});
  		
  		listMovieScore();
  		
  		/* 댓글 리스트 뽑아오는 부분! ms_mid를 파라미터로 넘겨줘야한다.  */
  		function listMovieScore(){
  			
  			/* var page = $("#page").val();
  			alert(page);  
  			 var page = 1;
  			var page_div=$("#page").val();
  			alert(page_div);
  			
  			 if(page_div!=null&&page_div!="")
  			{ 
  				$(".paging").click(function(){
  					page = $(this).text();
  					alert(page+"페이징 클릭");
  				});
  				 
  			} */
  			
  			
  			
  			//alert(page); 
  			$.ajax({
  				type:"get",
  				url:"listMovieScore.com?ms_mid=${m.m_number}",
  				success: function(data) {
  					var html;
  					var tr;
  					$("#re_table").empty();
  				
  					$.each(JSON.parse(data),function(index,item){
  						
  						tr = $("<tr></tr>").attr("height","50px");
  						var td = $("<td></td>")
  						var img = $("<img/>").attr({"src":"resources/images/user.png",
  							"width":"40px","height":"40px"});
  						$(img).appendTo($(td));
  						var td1 = $("<td></td>").text(item.ms_custid);
  						var td2 = $("<td></td>").attr("width","15%");
  						var star = item.ms_score;
						
  						var raty = $("<div></div>").attr("id","raty_div").raty({ readOnly: true, score: star , starOn: "resources/images/star-on.png",
  				  			 starOff: "resources/images/star-off.png" });
  						
  						var td3 = $("<td></td>").attr("class","com").text(item.ms_comment).attr("width","500px");
  						var td4 = $("<td></td>");
  						
  						var ms_no = $("<div><div>").attr({"class":"ms_no","idx":item.ms_no}).css("display","none").text(item.ms_no);
  						
  						$(td4).append(ms_no);
  						//$("#paste_no").append(ms_no);
  						$(td2).append(raty);
  						$(tr).append(td,td1,td2,td3,td4); 
  						
  						
  						if(cheklog==item.ms_custid){
  							
  						var td4 = $("<td></td>").html("<span class='revise'>수정</span>");
  						var td5 = $("<td></td>").html("<span class='delete'>삭제</span>");
  						$(tr).append(td4,td5); 
  						}
  						

							 
  						$("#re_table").append(tr);
  					});
  						//$("#page").html(data.pageStr);
  						
  				
  						
  				
  					var no;
  					$(".revise").on("click",function(){
  						 var tr=$(this).closest("tr"); //누른거의 가장 가까운 tr을 찾는 코드 ! 
						 no= $(tr).find(".ms_no").attr("idx");	 
						
						
  						$.ajax({
  							url:"updateMovieScore.com?ms_no="+no,
  							type:"get",
  						  	dataType : "json",
  							success:function(data){
  							
  								
  									 var star = data.ms_score;
  								
  									$("#modal_rating").raty({	targetKeep : true,
  						 				target:"#span_rating", score: star , starOn: "resources/images/star-on.png",
  			  				  			 starOff: "resources/images/star-off.png"});
  									$("#revise_comment").text(data.ms_comment);
  									$("#modal_mid").text(data.ms_mid);
  									
  									$("#reviseModal").modal();
  								  	
  									
  									
  									$("#btn_revise").click(function(){
  									
  									var revise_comment = $("#revise_comment").val();
  									
  									if(revise_comment==""){
  				  						alert("내용을 입력하지 않았습니다.");
  				  						  $('#revise_comment').focus();
  				  						  return;

  				  						}
  				  					else{
  				  							reviseComment();
  				  						}
  										
  									});
  								
  							}
  						
  						});
					
					
						
					});//revise
					
					
  					
					$(".delete").click(function(){
						
						
						 var firm= confirm("삭제하시겠습니까?");
						 
						 var tr=$(this).closest("tr"); //누른거의 가장 가까운 tr을 찾는 코드 ! 
						 no= $(tr).find(".ms_no").attr("idx");	 
						 var mid = $("#mnumber").val();
						 
						
						 if(firm){
							 
							 
							 
							  $.ajax({
									 url:"deleteMovieScore.com?ms_no="+no+"&ms_mid="+mid,
									success:function(data){
										
										listMovieScore();
									}/* ,
									error:function(data){
										alert("삭제실패");
										listMovieScore();
									} */
								 });  
							 
						 }else{
							
							 
						 }
						
						 
						 
						 
					});
  					
  					
						
						
  					/*평점 수정 함수 */
  			  		function reviseComment(){
  			  			
  			  			
  			  			var score = $("#modal_rating").raty('score');
  			  			
  			  			var comment = $("#revise_comment").val();
  			  			
  			  			var mid = $("#modal_mid").text();
  			  		
  			  			   $.ajax({
  			  				url:"updateMovieScore.com",
  			  				type:"post",
  			  				data:{ms_no:no,ms_score:score,ms_comment:comment,ms_mid:mid},
  			  				success:function(data){
  			  				$("#reviseModal").modal('hide');
  			  					listMovieScore();
  			  					
  			  				},
  			  				error:function(){
  			  					alert("ajax통신 실패!ㅠ");
  			  				}
  			  				
  			  			}); 
  			  			  
  			  			
  			  		}
  			  		
	  			
  					
  			
  					
  					
  					
  				}//success		
  			});	//ajax
  			
  		
  		};
  		
  	
  		
  		
  		
  		
  		/* 등록 버튼 누르면 댓글 등록되게하기 ! 비로그인시 -> 로그인 유도 팝업창 
  									로그인되있을시 -> moviescore insert하기!  */
  		$("#btn_register").click(function(){
  			var currentScore = $('#div_rating').raty('score'); //별점
  		
  			
  			
  			$("#star").val(currentScore);
  			$("#logId").val(cheklog);
  			
  			
  			
  			if(cheklog == null || cheklog==""){
  				
  				var nonlogin = $("#myModal").modal();

  			}
  			else{
  				//alert("로그인했네?");
  				var params =$("#formId").serialize();
  				var com =  $("#comment").val();
  				
  				
  				if(com==""){
  					alert("내용을 입력해주세요.");
  					$("#comment").focus();
  					return;
  				}
  				else{
  					
  					$.ajax({
  		  				
  	  					url:"insertMovieScore.com",
  	  					type: "post",
  	  					data:params,
  	  					success:function(data){ 
  	  						$("#comment").val("");
  	  						listMovieScore();
  	  						
  	  					},
  	  					
  	  				
  	  				});
  					
  				}
  				
  			
  			
  				
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
 
<%--     <div class="col-md-1" style="float:left;"> <a href="updateMovie.com?m_number=${m.m_number }"><button type="button" class="btn btn-primary" >수정</button></a> </div>
 --%>	
    </p>
    </div>
	</div>


<hr>
<div class="container">

 
<div class="row">
	<div class="col-md-3">
	<div id="img_grade"></div>
	 <a href="resources/upload/${m.m_image }" title="포스터 크게 보기 새창" target="_blank">
	<img alt="${m.m_name } 새창" src="resources/upload/${m.m_image }" width="220" height="340" style="display: block;">포스터 크게 보기
	</a>
	</div>
	<div style="float: left;">
		<div>
		<h3><strong>${m.m_name }</strong></h3>
		<label id="lab_showing">${m.m_isshowing }</label>
		</div>
		<label id="m_grade" style="visibility: hidden;">${m.m_grade }</label>
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

 <c:if test="${m.m_isshowing==1}" >
<div>
<div class="well well-sm" id="well" ><h4><strong>평점 주기</strong></h4><h5><strong>(현재 평점 : ${m.m_score })</strong></h5></div>
 
 

 
<div id="div_comment">
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
		<input type="hidden" id="mnumber" name="ms_mid" value="${m.m_number }">
		<input id="star" type="hidden" name="ms_score">
		<input id="logId" type="hidden" name="ms_custid">
      <textarea maxlength="100" class="form-control col-sm-4" rows="3" id="comment" name="ms_comment" placeholder="로그인한 회원만 이용 가능합니다." style="width:580px;"></textarea>
     
      <button type="button" id="btn_register" class="btn btn-default btn-lg" style="height: 60px"><strong>등록</strong></button></span>
    </div>
 </form>
 
 

</span>
<br><br><br><br>

<div id="reply"><!-- moviescore select 해올 부분 (댓글달린거 보여주려고) -->
	<div id="paste_no"></div>
	
	<table id="re_table" width="90%">
	
	</table><br>
	<div id="page"><center>${pageStr }</center></div>
	
</div> 

</div>
</c:if>

<br><br><br>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <center><h4 class="modal-title"><strong>알림</strong></h4></center>
        </div>
        <div class="modal-body">
          <center><p>로그인 후 이용가능한 서비스 입니다.</p></center>
        </div>
        <div class="modal-footer">
          <center><button type="button" class="btn btn-info" data-dismiss="modal">확인</button></center>
        </div>
      </div>
    </div>
  </div>
  
  
  <!-- 평점 수정 Modal -->
  <div class="modal fade" id="reviseModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <center><h4 class="modal-title"><strong>평점 수정</strong></h4></center>
        </div>
        <div class="modal-body">
        	<div id="modal_mid" style="display: none;"></div>
        	<form id="reviseForm">
        		<div class="form-group" >
        			<input type="hidden" id="revise_send_star" name="ms_score">
        			<input type="hidden" id="revise_no" name="ms_no">
        			<img src="resources/images/user.png" width="30px" height="30px" style="float: left;">
        		<div id="modal_rating" style="float: left; left: -20px"></div><span id="span_rating" style="float: left;"></span>
         			<div>
         			      <textarea maxlength="100" class="form-control col-sm-3" rows="3" id="revise_comment" name="ms_comment" style="resize: none;"  required></textarea>

         			</div>
         		</div>
        	</form>
         
        </div>
        <div class="modal-footer">
          <center><button id="btn_revise" type="button" class="btn btn-info">수정</button></center>
        </div>
      </div>
    </div>
  </div>




</body>
</html>