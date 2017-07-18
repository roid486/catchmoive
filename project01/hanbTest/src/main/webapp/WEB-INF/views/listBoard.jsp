<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시물 목록</h2>
	<hr>
	<a href="insertBoard.do">등록</a><br>
	<table border="1" width="80%">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>			
		</tr>
		<c:forEach var="b" items="${list }">
			<tr>
				<td>${b.no }</td>
				<td>
					<c:if test="${b.b_level > 0 }">
						<c:forEach var="i" begin="1" end="${b.b_level }">
							&nbsp;&nbsp;
						</c:forEach>
						<img src="resources/img/re.png" width="12" height="12">
					</c:if>				
				   <a href="detailBoard.do?no=${b.no }">${b.title }</a>
				</td>
				<td>${b.writer }</td>
				<td>${b.regdate }</td>			
			</tr>
		</c:forEach>		
	</table>
	전체페이지:
	<center>${pageStr }</center>
</body>
</html>


