<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/eunseok/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" href="resources/eunseok/style.css" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.4.3.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="resources/eunseok/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript"
	src="resources/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script type="text/javascript">
	$(function() {
		$("a[rel=fancybox]").fancybox({
			width : 1000,
			height : 600,
			showCloseButton : false
		});
	})
</script>
<title>Insert title here</title>
</head>
<body>
	 <jsp:include page="/WEB-INF/views/menubar.jsp"></jsp:include>
</body>
</html>