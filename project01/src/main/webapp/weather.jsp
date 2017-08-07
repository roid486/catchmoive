 <%@page import="java.net.URLEncoder"%>
 <%@page import="java.io.InputStream"%>
 <%@page import="java.net.URL"%> 
 <%@page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	String loc = (String)request.getParameter("loc");
	String x = (String)request.getParameter("mx");
	String y = (String)request.getParameter("my");
	
	String arr[] = loc.split(" ");
	System.out.println(arr[0]+"//"+ arr[1] + "//"+arr[0].substring(0,2));
 	URL url = new URL("http://apis.skplanetx.com/weather/forecast/3days?appKey=f5679cfa-f710-32bb-b94b-e9d6999b5858&lon=126.940198&village="+arr[2]+"&county="+arr[1]+"&foretxt=&lat=37.556448&city="+arr[0].substring(0,2)+"&version=1");
 	InputStream is = url.openStream();
 	String str = "";
 	int ch;
 	while ((ch = is.read()) != -1) {
 	str += (char)ch;
 	}
 	is.close();
	
 	System.out.println(str);
	
  	String data = new String(str.getBytes("iso-8859-1"), "utf-8");
%>
<%=data %>

