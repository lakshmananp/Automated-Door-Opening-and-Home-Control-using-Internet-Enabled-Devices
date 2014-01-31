<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#id1
{
background-color:black;
color:white;
height:120px;
left:75px;
}
#idd
{
position:absolute;
left:30px;
}
.cc
{
   cursor:pointer;
   font-size:15px;
   font-family:Comic Sans MS,sans-serif;
   font-weight:bold;
   text-decoration:underline;
   color:#FFCC00;
   background-color:#000000;
   border-style:window-inset;
   cursor:pointer;
}
label
{
color:red;
}
#id2
{
background-color:#ffcc00;
position:absolute;
left:10px;
color:black;

}
</style>
<script type="text/javascript">
function logcheck()
{
var f=0;
var s1=document.getElementById("emailid");
var s2=document.getElementById("pswd");
document.getElementById("l1").innerHTML="";
document.getElementById("l2").innerHTML="";
if(s1.value.length==0 || s1.value.indexOf("@") < 2)
{
f=1;
document.getElementById("l1").innerHTML="Please Enter a valid email-id";
}
if(s2.value.length==0)
{
f=1;
document.getElementById("l2").innerHTML="Please Enter a Password";
}
if(f!=1)
{
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
	  //alert(s1.value);
      var url="log.jsp";
      url +="?email=" +s1.value+"&pswd="+s2.value;
	  xmlHttp.onreadystatechange = listChange1;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
}
}

function listChange1(){ 
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
	  
	  var str=xmlHttp.responseText
	  //alert(str.charAt(0));
	  if(str.charAt(0)=="0")
	  {
	  document.getElementById("l1").innerHTML="email-id not <label>Registered</label>";
	  document.getElementById("pswd").innerHTML="";
	  }
	  else if(str.charAt(0)=="1")
	  {
	  document.getElementById("l2").innerHTML="incorrect Password";
	  document.getElementById("pswd").innerHTML="";
	  }
	  else if(str.charAt(0)=="2")
	  {
	  document.getElementById("body").setAttribute("onmouseover","delayer();");   
      }  	  
      }
	  }
	  function delayer(){
    window.location = "search.jsp"
}
function delayer1(){
    window.location = "error.jsp"
}
function chec()
{
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
      var url="logses.jsp";
	  xmlHttp.onreadystatechange = listChange2;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
}
function listChange2(){ 
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
	  var st=xmlHttp.responseText
	  //alert(st.charAt(0));
	  if(st.charAt(0)=="1")
	  {
      document.getElementById("body").setAttribute("onmouseover","delayer();");  
}	  
      }   
      }
</script>
</head>
<body id="body" onload="chec();">
<div id="id1">
 <a id="idd" href="start.jsp"><img src="logo.jpg"/></a>
<div style="float:right">
<br>
<table>
<tr>
<td><label style="color:#ffcc00;font-size:10px;font-family:Comic Sans MS,sans-serif;font-weight:bold;">Email</label></td>
<td><label style="color:#ffcc00;font-size:10px;font-family:Comic Sans MS,sans-serif;font-weight:bold;">Password </label></td></tr>
<tr><td><input type="text" placeholder="Email Id" name="emailid" size="20px" id="emailid" /></td>
<td><input type="password" name="logpswd" placeholder="Password"  id="pswd" /><br></td>
<td align="right"><input class="cc" type="button" value="Sign in" id="but" onclick="logcheck()"></td></tr>
<tr><td><label id="l1"></label></td><td><label id="l2"></label></td></tr>
<tr><td colspan="2" align="right"><a  href="fpswd.jsp" target="blank" style="color:#ffcc00;font-size:10;" onmouseover="highh()" onmouseout="lowh()" /> Forgot password ? </a></td></tr>
</table>	</div></div>
<div id="id2" border="2">

<div id="error"></div>
</div>
	</body></html>
