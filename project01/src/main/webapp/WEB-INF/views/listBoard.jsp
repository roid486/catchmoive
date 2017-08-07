<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* var customer_id */
		 <%-- var id1 = <%= session.getAttribute("se_id")%> --%>
		<%-- var id2 = "<%= (String)session.getAttribute("customerid2")%>" --%>
		 var id1 = $("#se_id").val();

	 	$("#msgdialog").dialog({
	         autoOpen:false,
	         modal:true
	      }); 
	
		$("#btn_insert").click(function() {
			alert("id1  ::   "+id1)
			if(id1==null || id1=="")
			{
				/* $("#msgdialog").dialog("open"); */
				alert("이삭이 msdialog");
			}
			else
			{
				location.href="insertBoard.com";
			} 			
		});
		
		
		//마우스효관
		$("#btn_insert").mouseover(function() {
			$("#btn_insert").text("글쓰기");
		});
		$("#btn_insert").mouseout(function() {
			$("#btn_insert").text("write");
		});
		
		//임의
		

		
	}); 

</script>
<style type="text/css">
#bottom {
	position: relative;
	background-color: brown;
	color: white;
}

#table {
	width: 100%;
	border: 1px solid black;
	border-right: none;
	border-left: none;
	border-bottom: none;
}

tr, th, td {
	padding: 10px;
}
#menu {
	position: absolute; 
	top:500px;
	color: #80d4ff;
}
#w3-bar-item {
	font-family: -윤고딕340;
}
</style>
</head>

<body>
	<input type="hidden" id="se_id" value="${se_id }">
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	
	<!-- Sidebar -->
		<div  class="w3-sidebar w3-light-grey w3-bar-block" style="width: 15%; border:1px solid #80d4ff"  id="menu">
			<h3 class="w3-bar-item" id="w3-bar-item">Side Bar</h3>
			<a href="listBoard.com" class="w3-bar-item w3-button">게시판</a>
			<br><a href="listNotice.com" class="w3-bar-item w3-button">공지사항</a>
			<br>
			<br>
			
		</div>
		
		<div style="margin-left:15%">

	<center>
		<h1>
			<strong style="color: #8CCBFB">${title }</strong>
		</h1>
	</center>
	<a href="listNotice.com">임시공지사항이동</a>

	<hr>
	<div class="table-responsive">
		<div class="container">
			<table id="table" class="table">
				<tr>

					<td align="center" bgcolor="#A1D6FE" colspan="3">제목</td>
					<td bgcolor="#A1D6FE">작성자</td>
					<td align="center" bgcolor="#A1D6FE">작성일</td>
					<td bgcolor="#A1D6FE">조회</td>
				</tr>


				<c:forEach var="b" items="${list }">
					<tr>
						<td>${b.b_number }</td>
						<td width="15%">${b.b_type }</td>
						<td>
							<a href="detailBoard.com?b_number=${b.b_number }">${b.b_title } <c:if test="${b.b_recnt > 0}">
									<span class="badge"><span style="color: white;">${b.b_recnt}</span></span>
								</c:if>
							</a>
						</td>
						<td width="15%">${b.c_id }</td>
						<%-- <td>${b.c_name }</td> --%>
						<td width="15%">${b.b_regdate }</td>
						<td width="5%">${b.b_hit }</td>
					</tr>
				</c:forEach>

			</table>
			<center>${pageStr }</center>
			<hr style="border:solid 1px #A1D6FE;">
		</div>
	</div>
	
	<div class="container">
		<div align="right">
			<button class="btn btn-default" style="color: #8CCBFB" id="btn_insert">write</button>
		</div>
		<hr style="border:solid 2px #A1D6FE;">
		<form class="form-horizontal" action="listBoard.com" method="post">
		<center>
			<div align="center" class="form-group">
		
				<select  class="control-label col-sm-1" name="searchField">
						<option value=c_id>작성자</option>
						<option value="b_title">제목</option>
						<option value="b_content">내용</option>
					</select> 
					 <div class="col-sm-4">          
 					<input  class="form-control" type="text" name="keyword"> 
    				 </div>
					 <div class="col-sm-1">
					<input  class="btn btn-default"  style="color: #8CCBFB" type="submit" value="검색">
					</div>



			</div>
			</center>
		
		</form>
	</div>
	<div id="bottom">
		<jsp:include page="/WEB-INF/views/mainbottom.jsp"></jsp:include>
	</div>
	
	</div>
	
</body>
</html>