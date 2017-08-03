<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
$(function() {
	var id1 = $("#se_id").val();
	alert("id1 디테일보드  ::"+id1);
	

	
	 // 댓글 수정
    $("#btnReplyUpdate").click(function(){
        var re_content = $("#re_content").val();
        
        var re_number = "${r.re_number}";
        alert("re_content 내용::"+re_content);
        
        var param="re_content"+re_content+"&re_number= "+re_number;
        alert("param ::"+param)
       
        $.ajax({
            type:"post",
            dataType:"text",
            url:"updateReply.com?re_number=${r.re_number}",
            data:{"re_content":re_content,"re_number":re_number},
            success: function(data){
                
                	alert("성공");
                    $("#modifyReply").css("visibility", "hidden");
                    // 댓글 목록 갱신
                    /* location.href="listBoard.com"; */
                   
                    
                },
                error: function(data){ 
                	
                    	alert("실패");
                    	$("#modifyReply").css("visibility", "hidden");
                        // 댓글 목록 갱신
                    	 
                	}
                
            
        });
    });
   
    
    //  댓글 상세화면 닫기
    $("#btnReplyClose").click(function(){
        $("#modifyReply").css("visibility", "hidden");
    });
    
});
</script>
</head>
<body>
<input type="hidden" id="se_id" value="${se_id }" >
댓글 번호 : ${r.re_number}<br>
    <textarea id="re_content" rows="5" cols="82">${r.re_content}</textarea>
    <div style="text-align: center;">
        <!-- 본인 댓글만 수정, 삭제가 가능하도록 처리 -->
       <%--  <c:if test="${sessionScope.se_id == r.c_id}"> --%>
            <button type="button" id="btnReplyUpdate" >수정</button>
            <button type="button" id="btnReplyDelete" >삭제</button>
     <!-- c:if마감해줘야함 -->
        <button type="button" id="btnReplyClose" >닫기</button>
    </div>
</body>
</html>