<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
.angk {
	cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function () {
		$(".angk").click(function () {
			var enumb = $(this).attr("idx");
			location.href="eventdetail.com?e_number="+enumb;
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
	<div>
		<center>
			<table cellspacing="5">
				<tr>
					<c:forEach var="el" items="${clist }" varStatus="status">
						<td
							style="padding-right: 40px; padding-bottom: 30px; padding-left: 40px; padding-top: 30px">
							<img class="angk" src="resources/eventimg/${el.e_img }"
							width="220" height="320" idx="${el.e_number }"><br>
							<div style="text-align: center; font-size: 12pt;">
								<strong> <label class="angk" id="div_name"
									idx="${el.e_number }">${el.e_title }</label>
								</strong>
							</div>
						</td>
						<c:if test="${(status.index+1) % 2 ==0 }">
				</tr>
				<tr>
					</c:if>
					</c:forEach>
				</tr>

			</table>
		</center>
		<br>
		<%-- <center><strong>${pageStr }</strong></center> --%>
		<center>${pagenum }</center>



	</div>
</body>
</html>