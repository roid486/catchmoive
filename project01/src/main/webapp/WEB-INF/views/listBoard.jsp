<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>${title }</h1>
	<hr>

	<table border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td>�Խ��ǹ�ȣ</td>
			<td>����</td>
			<td>ID</td>
			<td>�����</td>
		</tr>
		
		<c:forEach var="b" items="${list }">
		<tr>
			<td>${b.b_number }</td>
			<td>${b.b_title }</td>
			<td>${b.customer_id }</td>
			<td>${b.b_regdate }</td>
		</tr>
		</c:forEach>
	</table>
	<a href="insertBoard.com">�Խù� ���</a>	
</body>
</html>