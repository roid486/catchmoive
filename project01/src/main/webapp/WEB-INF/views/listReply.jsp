<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="se_id" value="${se_id }" >
	<table>
		<c:forEach var="row" items="${listRe }">
		<tr>
			<td>${row.re_number }&nbsp&nbsp&nbsp${row.c_name}&nbsp&nbsp&nbsp${row.re_regdate }</td>
			<td>내용:${row.re_content}(비밀여부:${row.re_secretreply})</td>
		<!-- 본인 댓글만 수정버튼 생성되도록 처리 -->
				<td>
                <c:if test="${sessionScope.se_id == row.c_id}">							 
                    <input type="button" id="btnModify" value="수정" onclick="deleteRe('${row.re_number}')">
                </c:if>
                </td>
		</tr>
		
		</c:forEach>
	</table>
	
	<%-- <c:if test="${sessionScope.se_id == b.c_id}">
	<a href="deleteBoard.com?b_number=${b.b_number }"><button type="button" id="btn_del">삭제</button></a>
    <a href="updateBoard.com?b_number=${b.b_number }"><button type="button" id="btn_update">수정</button></a>
    </c:if> --%>
</body>
</html>