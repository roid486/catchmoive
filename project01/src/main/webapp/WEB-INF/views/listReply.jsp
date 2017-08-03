<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	

function showReplyModify(re_number){

    $.ajax({
        type: "get",
        url: "detailReply.com?re_number="+re_number,
        success: function(result){
        	alert("성공!!!!!!!!");
            $("#modifyReply").html(result);
            // 태그.css("속성", "값")
            $("#modifyReply").css("visibility", "visible");
        },
        error: function(result){
        	alert("실패부분?")
        	$("#modifyReply").html(result);
        	// 태그.css("속성", "값")
        	$("#modifyReply").css("visibility", "visible");
		}
    });
};

</script>
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
                    <input type="button" id="btnModify" value="수정&삭제" onclick="showReplyModify('${row.re_number}')">
                </c:if> 
                </td>
		</tr>
		
		</c:forEach>
	</table>
	<!-- 댓글 수정 영역-->
    <div id="modifyReply"></div>
	
</body>
</html>