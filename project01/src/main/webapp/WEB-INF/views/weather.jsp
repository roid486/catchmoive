<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	URL url = new URL("http://apis.skplanetx.com/weather/current/hourly?appKey=f5679cfa-f710-32bb-b94b-e9d6999b5858&version=1&lat=37.556448&lon=126.940198&city=&county=&village=");
	InputStream is = url.openStream();
	String str = "";
	int ch;
	while ((ch = is.read()) != -1) {
	str += (char)ch;
	}
	is.close();
	
	int sno = str.indexOf("<body>");
	int lno = str.lastIndexOf("</body>");
	str = str.substring(sno, lno+7);
	String data = new String(str.getBytes("iso-8859-1"), "utf-8");
%>

<%=data %>

