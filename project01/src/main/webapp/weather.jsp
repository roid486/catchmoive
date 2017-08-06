 <%@page import="java.net.URLEncoder"%>
 <%@page import="java.io.InputStream"%>
 <%@page import="java.net.URL"%> 
 <%@page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>


<%
 	URL url = new URL("http://apis.skplanetx.com/weather/forecast/3days?appKey=f5679cfa-f710-32bb-b94b-e9d6999b5858&lon=126.940198&village=신촌동&county=서대문구&foretxt=&lat=37.556448&city=서울&version=1");
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

