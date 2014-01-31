<%@page import="java.sql.*"%>
<%@page import="myexample.login"%>
<%
try
{
String eid=request.getParameter("email");
String pswd=request.getParameter("pswd");
String buffer="";
 login ss= new login();
	int a=ss.authenticate(eid,pswd);
if(a==0)
{
buffer="0";
}
else if(a==1)
{
buffer="1";
}
else if(a==2)
{
session.setAttribute("user",eid);
buffer="2";
}
response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %> 
