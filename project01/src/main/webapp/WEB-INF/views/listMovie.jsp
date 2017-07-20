<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캐치무비 >> 무비차트</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
 <h2><strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;무비 차트</strong></h2>
  <br>
  <hr>
  <br>
 
 
	
 <center><table cellspacing="10">
 	<tr>
    		<c:forEach var="l" items="${l }" varStatus="status">
         	<td style="padding-right: 40px; padding-bottom: 30px; padding-left: 40px; padding-top: 30px">
				
				<a href="detailMovie.com?m_number=${l.m_number }">
				<img src="resources/upload/${l.m_image }" width="220" height="320"><br></a>
				
				<div style="text-align: center;font-size: 12pt">
				<a href="detailMovie.com?m_number=${l.m_number }">
				<label><strong>${l.m_name }</strong></label></a></div>
				<div><center>
				<label><f:formatDate value="${l.m_opendate }" pattern="yyyy.MM.dd"></f:formatDate> 개봉</label></center></div>
			</td>
                     
               <c:if test="${(status.index+1) % 4 ==0 }">
               	</tr><tr>
               </c:if>
            </c:forEach> 
   		 </tr>
    
    </table></center>
    <br>
    <%-- <center><strong>${pageStr }</strong></center> --%>
   
    
    
    

</body>
</html>