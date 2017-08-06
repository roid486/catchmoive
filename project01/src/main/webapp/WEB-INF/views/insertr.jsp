<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/ui/jquery-ui.min.css">
<link rel="stylesheet" href="resources/ui/jquery-ui.structure.min.css">
<link rel="stylesheet" href="resources/ui/jquery-ui.theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
	#menu {
		position: relative;
		z-index: 999;
	}
	#mtl{
		position: relative;
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
		var re = $("#re").val();
		$.ajax({
			type:"get",
			url:"movieselect.com",
			success: function(data) {
				var selec = $("<select></select>").attr({"class":"form-control","id":"m_number","name":"m_number"});
				$.each(JSON.parse(data),function (idx,item) {
					var opt = $("<option></option>");
					$(opt).text(item.m_name).attr("value",item.m_number);
					$(opt).appendTo(selec);
				});
				$(selec).appendTo("#msele");
			}		
		});
		
		$.ajax({
			type:"get",
			url:"mtselect.com",
			success: function(data) {
				var selec = $("<select></select>").attr({"class":"form-control","id":"mt_number","name":"mt_number"});
				$.each(JSON.parse(data),function (idx,item) {
					var opt = $("<option></option>");
					$(opt).text(item.mt_name).attr("value",item.mt_number);
					$(opt).appendTo(selec);
				});
				$(selec).appendTo("#mtsele");
				$(selec).click(function () {
					var mt_num = $("#mt_number option:selected").val();
					$("#tsele").empty();
					$.ajax({
						type:"get",
						url:"tselect.com",
						data:{
							mt_number:mt_num
						},
						success: function(data2) {
							var selec2 = $("<select></select>").attr({"class":"form-control","id":"t_number","name":"t_number"});
							$.each(JSON.parse(data2),function (idx2,item2) {
								var opt2 = $("<option></option>");
								$(opt2).text(item2.t_name).attr("value",item2.t_number);
								$(opt2).appendTo(selec2);
							});
							$(selec2).appendTo("#tsele");
						}		
					});
				});
			}		
		});
		
	});
</script>
</head>
<body>
	<input type="hidden" id="re" value="${re }">
	<div id="menu">
		<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	</div>
	<div id="msi">
		<jsp:include page="/WEB-INF/views/mside.jsp"></jsp:include>
	</div>
	<div class="container" id="mtl" style="width: 60%;">
	  <h2>시간표 등록</h2>
	  <form class="form-horizontal" action="insertr.com" method="post">
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="m_number">영화:</label>
	      <div class="col-sm-10" id="msele">
	        
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="mt_number">영화관:</label>
	      <div class="col-sm-10" id="mtsele">          
	        
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="t_number">상영관:</label>
	      <div class="col-sm-10" id="tsele">
	      
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="r_date">상영날짜:</label>
	      <div class="col-sm-10">
	        <input type="date" class="form-control" id="r_date" name="r_date" required="required">
	      </div>
	    </div>
	    <div class="form-group">
	      <label class="control-label col-sm-2" for="r_start">상영 시작시간:</label>
	      <div class="col-sm-10">          
	        <input type="text" class="form-control" id="r_start" placeholder="HH:MM으로 입력하십시오." name="r_start" required="required">
	      </div>
	    </div>
	    <div class="form-group">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button type="submit" class="btn btn-default">등록</button>
	      </div>
	    </div>
	  </form>
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