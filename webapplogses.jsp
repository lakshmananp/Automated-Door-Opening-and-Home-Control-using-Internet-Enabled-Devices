<%
String buffer="";
if((String) session.getAttribute("user")!=null)
{
buffer="1";
}
else
{
buffer="0";
}
response.getWriter().println(buffer); 
%>
