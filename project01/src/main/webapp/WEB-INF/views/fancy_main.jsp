<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script>
	!window.jQuery
			&& document
					.write('<script src="resources/eunseok/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript"
	src="resources/eunseok/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript"
	src="resources/eunseok/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/eunseok/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link rel="stylesheet" href="resources/eunseok/style.css" />
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
	<h1><a rel="fancybox" class="iframe" href="fancy_sub1.com">Test2</a></h1>
		
	<!-- <a rel="fancybox" href="#pp">Go JSp</a>
	<div id="pp">
		<iframe width="560" height="315" src="test2.do" frameborder="0"
			allowfullscreen></iframe>
	</div> -->
</body>
</html>