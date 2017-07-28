<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#btn_search").click(function(){
		//alert("검색 버튼 클릭!");
		
		var params = $("#formId").serialize();
		
		 $.ajax({
			url:'movieFinder.com',
			type:'POST',
			dataType: "json",
			data:params,
			success:function(data){
				/* var ajaxName = decodeURIComponent(data);
				alert(ajaxName); */
				alert(data);
				var tr = $("<tr></tr>");
				$.each(data,function(index,item){
					var td = $("<td></td>")/* .css({
						padding-right:"40px",
						padding-bottom:"30px",
						padding-left:"40px",
						padding-top:"30px"
					}) */;
					var img = $("#tb.img").attr("src",item.m_image);
					var lab = $("#tb_lab").text(item.m_name);
					
					$(img).appendTo($(tr));
					$(lab).appendTo($(tr));
					
					$(tr).appendTo($("#result_table"));
					if((index+1)%4 ==0){
												
					}
				});
				
				
			},
			error:function(){
				alert("ajax통신 실패!!!");
			}
		
		}); 
		
		
	});
	
	
});


</script>

<title>무비파인더>영화|캐치무비</title>

</head>
<body>
<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<h2>
		<strong>무비 파인더</strong>
	</h2>
	<hr>

	<form id="formId" action="movieFinder.com" method="post">
		
		<div class="well">
			
			 <span class="col-sm-3"> 
			<select name="searchField" class="form-control" id="sel1">
					<option value="m_name">영화 제목</option>
					<option value="m_director">영화 감독</option>
					<option value="m_actor">영화 배우</option>
			</select>
			</span> 
			<span class="col-sm-5 input-group"> 
			<input type="text" class="form-control" placeholder="키워드를 입력해 주세요." name="keyword">
				
		
			</span>
			
			
			<hr>
			<div>
			
			
			&nbsp;&nbsp;&nbsp;
			<span><strong>장르</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="checkbox-inline"> 
					<input type="checkbox" value="가족" name="m_genre">가족
					</label> 
					<label class="checkbox-inline"> 
					<input type="checkbox" value="드라마" name="m_genre">드라마
					</label> 
					<label class="checkbox-inline">
					<input type="checkbox" value="멜로/로맨스" name="m_genre">멜로/로맨스
					</label>
					<label class="checkbox-inline">
					<input type="checkbox" value="코미디" name="m_genre">코미디
					</label>
					<label class="checkbox-inline">
					<input type="checkbox" value="스릴러" name="m_genre">스릴러
					</label>
					<label class="checkbox-inline">
					<input type="checkbox" value="느와르" name="m_genre">느와르
					</label>
					<label class="checkbox-inline">
					<input type="checkbox" value="미스터리" name="m_genre">미스터리
					</label>
					<label class="checkbox-inline">
					<input type="checkbox" value="범죄" name="m_genre">범죄
					</label>
					<div class="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 					<label><input type="checkbox" value="뮤지컬" name="m_genre">뮤지컬&nbsp;</label>
 					<label><input type="checkbox" value="애니메이션" name="m_genre">애니메이션&nbsp;&nbsp;</label>
 					<label><input type="checkbox" value="액션" name="m_genre">액션&nbsp;&nbsp;</label>
 					<label><input type="checkbox" value="모험" name="m_genre">모험&nbsp;&nbsp;</label>
 					<label><input type="checkbox" value="판타지" name="m_genre">판타지&nbsp;&nbsp;</label>
 					<label><input type="checkbox" value="SF" name="m_genre">SF&nbsp;&nbsp;</label>
 					<label><input type="checkbox" value="전쟁" name="m_genre">전쟁&nbsp;&nbsp;</label>
 					<label><input type="checkbox" value="종교" name="m_genre">종교&nbsp;&nbsp;</label>
 					<label><input type="checkbox" value="무협" name="m_genre">무협&nbsp;&nbsp;</label>
 					
					
			</span>
			</div>
			<hr>
			<div>
			&nbsp;&nbsp;&nbsp;
			<span><strong>제작국가</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="checkbox-inline"> 
					<input type="checkbox" value="대한민국" name="m_nation">대한민국
					</label> 
					
						<label class="checkbox-inline"> 
					<input type="checkbox" value="미국" name="m_nation">미국
					</label> 
					
						<label class="checkbox-inline"> 
					<input type="checkbox" value="일본" name="m_nation">일본
					</label> 
					
						<label class="checkbox-inline"> 
					<input type="checkbox" value="중국" name="m_nation">중국
					</label> 
					
						<label class="checkbox-inline"> 
					<input type="checkbox" value="대만" name="m_nation">대만
					</label> 
					
						<label class="checkbox-inline"> 
					<input type="checkbox" value="프랑스" name="m_nation">프랑스
					</label> 
					
						<label class="checkbox-inline"> 
					<input type="checkbox" value="영국" name="m_nation">영국
					</label> 
					
					<label class="checkbox-inline"> 
					<input type="checkbox" value="독일" name="m_nation">독일
					</label> 
			
			
			</div>
			<hr>
			<div>
			&nbsp;&nbsp;&nbsp;
			<span><strong>관람등급</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="checkbox-inline"> 
					<input type="checkbox" value="전체 관람가" name="m_grade">전체 관람가
					</label> 
					
					<label class="checkbox-inline"> 
					<input type="checkbox" value="12세 관람가" name="m_grade">12세 관람가
					</label> 
					
					<label class="checkbox-inline"> 
					<input type="checkbox" value="15세 관람가" name="m_grade">15세 관람가
					</label> 
					
					<label class="checkbox-inline"> 
					<input type="checkbox" value="청소년 관람불가" name="m_grade">청소년 관람불가
					</label> 
			
			
			
			
			
			</div>
			<hr>
			
				&nbsp;&nbsp;&nbsp;
			<span class="col-sm-5 input-group">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<label style="float: left"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제작년도</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			
			<input  class="input-group" type="text" style="float: left" class="form-control" name="startyear">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<label style="float: left">&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;</label>
			<input  class="input-group" type="text" style="float: left" class="form-control" name="endyear">
				

			</span>  
		
			
			<br>
			<div align="center">
			<button type="submit" class="btn btn-danger" id="btn_search"><b>검색</b></button>
			</div>
		</div>
	</form>
	
	<hr>
	<h3 align="center" id="result"><strong>${str }</strong></h3>
	<br>
	<table cellspacing="10" id="result_table">
		<tr id="tr1">
		<c:forEach var="m" items="${list }" varStatus="status">			
			<td style="padding-right: 40px; padding-bottom: 30px; padding-left: 40px; padding-top: 30px">
				
				<a href="detailMovie.com?m_number=${m.m_number }">
				<img src="resources/upload/${m.m_image }" id="tb_img" width="220" height="320"><br></a>
				
				<div style="text-align: center;font-size: 12pt">
				<a href="detailMovie.com?m_number=${m.m_number }">
				<label id="tb_lab"><strong>${m.m_name }</strong></label></a></div>
				
			</td>
			
				<c:if test="${(status.index+1) % 4 ==0 }" >
					</tr><tr>
				</c:if> 
			
		</c:forEach>
		</tr>
	
	
	</table>
	
	


</body>
</html>