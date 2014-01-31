<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.back
{
cursor:pointer;
   font-size:15px;
   font-family:Comic Sans MS,sans-serif;
   font-weight:bold;
   text-decoration:underline;
   color:#FFCC00;
   background-color:#000000;
   border-style:window-inset;
}
#id1
{
background-color:black;
color:white;
height:100px;
left:75px;
}
#idd
{
position:absolute;
left:30px;
}
#idf
{
background-color:#ffcc00;
color:black;

position:absolute;
left:200px;
top:300px;
}
#idff
{
color:black;

position:absolute;
left:800px;
top:250px;
}
</style>
<script type="text/javascript">

	  
	  function getps()
{
var st=document.getElementById("eid").value;
if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="fps1.jsp";
	  url+="?eid="+st;
	  xmlHttp.onreadystatechange = listChange92;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }
	  
	  function listChange92(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
		var str=xmlHttp.responseText 
      document.getElementById("idf9").innerHTML=str;
      }   
      }
</script></head>
<body>
<div id="id1">
 <a id="idd" href="logn.jsp"><img src="logo.jpg"/></a>
</div>
<div id="idf" style="visibility:visible">
<br>
Email :
<input type="text" placeholder="Email Id" name="email" size="50px"  id="eid" />
<center><input type="button" class="cc" value="Get Password!" id="but" onclick="getps();" /></center>
<br><br><br>
<p style="color:green">Enter your email id and click <b>OK</b></p>
</div>
<div id="idf9"></div>
</body>
</html>
