<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%-- <input type="hidden" id="se_id" value="${se_id }" > --%>
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<h2>공지사항</h2>
	<hr>
	<table>
		<tr>
			<td width="90%">
				<form action="listNotice.com" method="post">
					<select name="searchField">
						<option value="nb_title">제목</option>
						<option value="nb_content">내용</option>
					</select> <input type="text" name="keyword"> <input type="submit"
						value="검색">
				</form> <a href="insertNotice.com">등록</a><br>
				<table border="1" width="80%">
					<tr>
						<td><a href="listNotice.com?orderField=nb_number">번호</a></td>
						<td><a href="listNotice.com?orderField=nb_title"> 제목</a></td>
						<td><a href="listNotice.com?orderField=nb_regdate"> 작성일</a></td>
						<td>조회수</td>
					</tr>
					<c:forEach var="n" items="${list }">
						<tr>
							<td>${n.nb_number }</td>
							<td><a href="detailNotice.com?nb_number=${n.nb_number }">${n.nb_title }</a>
							</td>
							<td>${n.nb_regdate }</td>
							<td>${n.nb_hit }</td>

						</tr>
					</c:forEach>
				</table> 전체페이지:
				<center>${pageStr }</center>
			</td>
		</tr>
	</table>
	<div id="msgdialog">
		<center>
			<font color="red">로그인을 하십시오.</font>
		</center>
	</div>
</body>
</html>

