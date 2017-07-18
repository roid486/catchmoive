<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="m" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		var msg = $("#msg").val();
		if(msg != null && msg != "")
		{
			alert(msg);
		}
		
	});
</script>
</head>
<body>
	<input type="hidden" value="${msg }" id="msg">
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<center>
		<div>
			<table>
			<form action="serchid.com">
					<tr>
						<td>ID : </td>
						<td><input type="text" name="id" value="${serchid }" onblur="입력하십시오."></td>
						<td><input type="submit" value="중복확인"></td>
					</tr>
				</form>
				<form action="signup.com" method="post">
				<input type="hidden" name="customer_id" value="${serchid }">
					<tr>
						<td>PASSWORD : </td>
						<td><input type="password" name="customer_pw" placeholder="8자 이상 입력하십시오." onblur="입력하십시오."></td>
					</tr>
					<tr>
						<td>PASSWORD 재확인 : </td>
						<td><input type="password" name="customer_pw2" placeholder="8자 이상 입력하십시오." onblur="입력하십시오."></td>
					</tr>
					<tr>
						<td>name : </td>
						<td><input type="text" name="customer_name" value="${name }" readonly="readonly" onblur="입력하십시오."></td>
					</tr>
					<tr>
						<td>addr : </td>
						<td><input type="text" name="customer_addr" onblur="입력하십시오."></td>
					</tr>
					<tr>
						<td>tel : </td>
						<td><input type="text" name="customer_tel" value="${tel }" readonly="readonly" onblur="입력하십시오."></td>
					</tr>
					<tr>
						<td>email : </td>
						<td><input type="text" name="customer_email" onblur="입력하십시오."></td>
						<td><select name="backmail">
							<option value="@naver.com">@naver.com</option>
							<option value="@hanmail.net">@hanmail.net</option>
							<option value="@gmail.com">@gmail.com</option>
						</select></td>
					</tr>
					<tr>
						<td>gender : </td>
						<td><select name="customer_gender">
							<option value="남자">남자</option>
							<option value="여자">여자</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="3"><center><input type="submit" value="회원가입"></center></td>
					</tr>
				</form>
			</table>
		</div>
	</center>
</body>
</html>