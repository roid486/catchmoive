<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		var msg = $("#msg").val();
		if(msg!="")
		{
			alert(msg);
		}
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<div>
		<center>
			환영합니다.<br> 
			Catch Movie는 1인 1계정을 원칙으로 합니다.<br>
			이미 가입되신분은 회원가입이 불가능합니다. <br>
			회원은 아이디/비밀번호 찾기를 하시기 바랍니다.<br>
			<br>
			<br>
			<form action="serchcust.com" method="post">
				<table align="center">
					<tr>
						<td>이름 : </td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>전화번호 : </td>
						<td><input type="text" name="tel"></td>
					</tr>
					<tr>
						<td colspan="2"><center><input type="submit" value="검색"></center></td>
					</tr>
				</table>
			</form>
		</center>
	</div>
	<input type="hidden" id="msg" value="${msg }">
</body>
</html>