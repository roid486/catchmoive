<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캐치무비>>관리자>>영화 정보 수정</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript">
$(function(){
	var grade = $('#select_m_grade').attr("data-type");
	/* 
	alert(grade); */
	/* $("#m_grade option[value=grade]").attr("selected","selected"); */
	  $("#select_m_grade").val(grade).text();
	  $("#select_m_grade").find("option:"+grade).attr("selected","selected");  
	
	
	
	var showing = $("#m_isshowing").attr("val");

	 $("#m_isshowing").val(showing).text();
	/* $("select.m_isshowing option[value='"+showing+"']").attr("selected","selected"); */
	$("#m_isshowing").find("option:"+showing).attr("selected","selected");
	
	
	
	
});
</script>


<body>
	<div class="container">
		<h2>영화 수정</h2>
		<form class="form-horizontal" action="updateMovie.com" method="post"
			enctype="multipart/form-data">
			
			<input type="hidden" name="m_number" value="${m.m_number }">
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_name">영화 제목:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_name"
						placeholder="영화 제목을 써주세요." name="m_name" required="required" value="${m.m_name }">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_director">감독
					이름:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_director"
						name="m_director" required="required" value="${m.m_director }">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_actor">주연 배우:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_actor" name="m_actor"
						required="required"  value="${m.m_actor }">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_nation">개봉 국가:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_nation"
						name="m_nation" required="required"  value="${m.m_nation }">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_runningtime">상영
					시간:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_runningtime"
						placeholder="러닝타임 작성예)140" name="m_runningtime"
						required="required"  value="${m.m_runningtime }">
				</div>
			</div>
		
		
			<div class="form-group">
            <span class="col-sm-2 control-label">
			<label for="m_grade">영화 관람 등급:</label></span>
            <div class="col-sm-4">
			<select class="form-control" id="select_m_grade" name="m_grade" data-type="${m.m_grade}">
				<option value="전체 관람가">전체 관람가</option>
				<option value="12세 관람가">12세 관람가</option>
				<option value="15세 관람가">15세 관람가</option>
				<option value="18세 관람가">18세 관람가</option>
			</select>
            </div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_genre">영화 장르:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_genre" name="m_genre"
						required="required" value="${m.m_genre}">
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_opendate">개봉일:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_opendate"
						placeholder="작성예) yyyy/mm/dd" name="m_opendate"
						required="required" 
						value="<f:formatDate value="${m.m_opendate }" pattern="yyyy/MM/dd" />">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_synop">줄거리:</label>
				<div class="col-sm-8">
					<textarea class="form-control" placeholder="줄거리를 입력해 주세요!" rows="9"
						id="m_synop" name="m_synop" required="required">${m.m_synop }</textarea>

				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="m_image">포스터 이미지:</label>
				<div class="col-sm-8">
					<input type="file" class="form-control" id="m_image" name="uploadFile"
						>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_trailer">예고편 url:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="m_trailer"
						name="m_trailer" required="required" value="${m.m_trailer }">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="m_score">평점:</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="m_score"
						placeholder="관리자는 평점 0으로 넣어주세요." name="m_score"
						required="required" value="${m.m_score }">
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="m_image1">스틸이미지1:</label>
				<div class="col-sm-8">
					<input type="file" class="form-control" id="m_image1"
						name="uploadFile1" >
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="m_image2">스틸이미지2:</label>
				<div class="col-sm-8">
					<input type="file" class="form-control" id="m_image2"
						name="uploadFile2" >
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="m_image3">스틸이미지3:</label>
				<div class="col-sm-8">
					<input type="file" class="form-control" id="m_image3"
						name="uploadFile3" >
				</div>
			</div>

			<div class="form-group">
            	<div class="col-sm-2 control-label">
				<label for="m_isshowing">영화 상영 여부:</label> </div>
                <div class="col-sm-3">
			<select class="form-control" id="m_isshowing" name="m_isshowing" val="${m.m_isshowing }">
				<option value="1">상영중</option>
				<option value="2">상영 예정</option>
				<option value="0">상영 종료</option>
			</select>
            </div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="m_boxoffice">예매율:</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="m_boxoffice"
						placeholder="Default값 0으로 입력 바람" name="m_boxoffice"
						required="required" value="${m.m_boxoffice }">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success" id="sub">영화 수정</button>
				  	<label id="lab">&nbsp;&nbsp;${success }</label>
				  	<label id="fail">&nbsp;&nbsp;${fail }</label>
				</div>
			</div>
			
		</form>
	</div>

</body>
</html>