<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* var customer_id */
		 var id1 = <%= session.getAttribute("se_id")%>
		<%-- var id2 = "<%= (String)session.getAttribute("customerid2")%>" --%>
		/* var id1 = $("#se_id").val(); */

		$("#msgdialog").dialog({
	         autoOpen:false,
	         modal:true
	      });
	
		$("#btn_insert").click(function() {
			if(id1==null || id1=="")
			{
				$("#msgdialog").dialog("open");
			}
			else
			{
				location.href="insertBoard.com";
			} 			
		});
		
		$("#btn_detail").click(function() {
			if(id1==null || id1="")
			{
				$("#msgdialog").dialog("open");
			}
			else
			{
				location.href="detailBoard.com";
			}
		})
		
	}); 

</script>
</head>
<body>
<input type="hidden" id="se_id" value="${se_id }" >
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>

	<h1>${title }</h1>
	
	<hr>
	<table border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>게시판번호</td>
			<td>TYPE</td>
			<td>제목</td>
			<td>ID</td>
			<td>등록일</td>
			<td>조회수</td>
		</tr>
		
		
		<c:forEach var="b" items="${list }">
		<tr>
			<td>${b.b_number }</td>
			<td>${b.b_type }</td>
			<td>
			<a id="btn_detail" href="detailBoard.com?b_number=${b.b_number }">${b.b_title }</a>
			</td>
			<td>${b.c_id }</td>
			<td>${b.b_regdate }</td>
			<td>${b.b_hit }</td>
		</tr>
		</c:forEach>
		
	</table>

	<button id="btn_insert">게시물 등록</button>

	<hr>
	<form action="listBoard.com" method="post">
	<select name="searchField">
		<option value= c_id>id</option>
		<option value="b_title">제목</option>
		<option value="b_content">내용</option>
	</select>
	<input type="text" name="keyword">
	<input type="submit" value="검색">	
	</form>	
	<div id="msgdialog">
		<center><font color="red">로그인을 하십시오.</font></center>
	</div>
</body>
</html>