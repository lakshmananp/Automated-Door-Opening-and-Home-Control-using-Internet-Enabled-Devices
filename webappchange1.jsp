<%@page import="java.sql.*"%>
<%@page import="myexample.homechange"%>
<%
try
{
String key=(String) session.getAttribute("user");
String name=request.getParameter("name");
String value=request.getParameter("value");
String buffer=" ";
homechange ss= new homechange();
	buffer=buffer+ss.getsetting(key,name,value);
response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %> 
