<%@page import="java.sql.*"%>
<%@page import="myexample.homeset"%>
<%
try
{
String key=(String) session.getAttribute("user");
String buffer="<div></div>";
homeset ss= new homeset();
	buffer=buffer+ss.getsetting(key);
response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %> 
