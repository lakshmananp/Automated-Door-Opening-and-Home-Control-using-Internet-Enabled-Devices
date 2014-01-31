<%@ page language="java" %>
<%@ page import="java.sql.*" %> 
<%@ page import="myexample.mail" %> 
<%
String buffer="";
try{
String eid=request.getParameter("eid");
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","anirudh");  
 Statement stmt = con.createStatement();  
ResultSet rs = stmt.executeQuery("Select pswd from users where emailid='"+eid+"'"); 
 rs.next();
String pswd=rs.getString(1);

mail ss= new mail();
	int f=ss.sendmail(eid,pswd);
if(f==2)
{
buffer="<label>sent</label>";
}
else if(f==1)
{
buffer="<label>not sent</label>";
}

}
catch(SQLException e)
 {
	System.out.println(e);
	buffer="email id not present";
	}
	response.getWriter().println(buffer); 
	%>
