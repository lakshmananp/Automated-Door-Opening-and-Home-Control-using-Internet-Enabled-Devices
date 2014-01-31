<html>
<head>
<style type="text/css">

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

color:black;

position:absolute;
left:100px;
top:110px;
}
.ic3
{
font-size:15px;
   font-family:Comic Sans MS,sans-serif;
   font-weight:bold;
   text-decoration:underline;
cursor:pointer;
color:black;
background-color:#ffcc00;
width:700px;
}
#t1
{
font-size:15px;
   font-family:Comic Sans MS,sans-serif;
   font-weight:bold;
width:700px;
}
#iiop
{
display:block;
cursor:pointer;
color:black;
background-color:#ffcc00;
position:relative;
max-width:700px;
}
#iiht
{
position:absolute;
left:900px;
top:300px;
}
#idid
{
position:absolute;
top:15px;
left:1150px;
}
#dstat
{
position:absolute;
top:165px;
left:1150px;
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
}
</style>
<script type="text/javascript">
function showlist(str){
	var typ=document.getElementById("sel").value;
	//alert(typ);
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
      var url="searchoption.jsp";
      url +="?count=" +str+"&typ="+typ;
      xmlHttp.onreadystatechange = listChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function listChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
		
      document.getElementById("countt").innerHTML=xmlHttp.responseText   
      }   
      }
	  
	  function clrr()
	  {
	  document.getElementById("dstat").innerHTML="";
	  }
	  
	  
	 function logout()
	 {	//alert("typ");
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
      var url="logout.jsp";
	  xmlHttp.onreadystatechange = listChange9;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
	 // alert("typ");
      }
	  
	  function listChange9(){   
	  //alert("typ");
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
		var str=xmlHttp.responseText 
		//alert(str);
		if(str.charAt(0)=="1")
		{
		//alert(str);
      document.getElementById("body").setAttribute("onmouseover","delayer();"); 
      }   
      }
	  }
	  
	  function delayer(){
    window.location = "start.jsp"
}
	  
	  
		
	  function settings(){
	//alert(typ);
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
      var url="sett.jsp";
      xmlHttp.onreadystatechange = listChange1;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function listChange1(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
		
      document.getElementById("om").innerHTML=xmlHttp.responseText   
      }   
      }
	  
	  function chang(nam,val){
	var name=nam;
	var value=val;
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
      var url="chang1.jsp";
	  url=url+"?name="+name+"&value="+value;
      xmlHttp.onreadystatechange = listChange121;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function listChange121(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
		
      document.getElementById("stat").innerHTML=xmlHttp.responseText   
      }   
      }
	  
	  function addcart(value){	
//alert(value);	  
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
//alert("item added");
var url="addtocart.jsp";
url=url+"?tid="+value;
xmlHttp.onreadystatechange=addedcart 
xmlHttp.open("GET",url,true)
xmlHttp.send(null)
}

function addedcart() { 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
    var showdata = xmlHttp.responseText; 
    document.getElementById("dstat").innerHTML=xmlHttp.responseText
    } 
}

function clrv()
	  {
	  var s=" ";
	  document.getElementById("countt").innerHTML=s;
	  }
	  function setex(str)
	  {
	  //alert(str);
	  document.getElementById("id").value=str;
	  }
	
	function onmon(s)
{
var st=document.getElementById(s);
st.setAttribute("style","cursor:pointer;background-color:black;width:700px;color:#ffcc00;font-size:25px;font-family:Comic Sans MS,sans-serif;font-weight:bold;text-decoration:underline;");
}
function onmoff(s)
{
var st=document.getElementById(s);
st.setAttribute("style","cursor:pointer;background-color:#ffcc00;width:700px;color:black;font-size:15px;font-family:Comic Sans MS,sans-serif;font-weight:bold;text-decoration:underline;");
}
function butout(ih)
{
var ci=document.getElementById(ih);
ci.setAttribute("style","font-size:15px;font-family:Comic Sans MS,sans-serif;font-weight:bold;text-decoration:underline;color:#FFCC00;background-color:#000000;border-style:window-inset;");
}
function buton(ih)
{
var ci=document.getElementById(ih);
ci.setAttribute("style","font-size:15px;font-family:Comic Sans MS,sans-serif;font-weight:bold;text-decoration:underline;color:#000000;background-color:#FFCC00;border-style:window-inset;");
}
function backsh(st)
	  {
	  document.getElementById(st).setAttribute("style","background-color:black;color:#ffcc00;font-size:15px;");
	  }
	  function backhi(st)
	  {
	  document.getElementById(st).setAttribute("style","background-color:#ffcc00;color:black;font-size:15px;font-weight:bold;");
	  }
	  function descr(str)
	  {
	  var s="d"+str;
	  document.getElementById(s).setAttribute("style","visibility:visible");
	  document.getElementById(str).innerHTML="<center> << Description </center>";
	  document.getElementById(str).setAttribute("onclick","hidesc(this.id)");
	  }
	  function hidesc(str)
	  {
	  var s="d"+str;
	  document.getElementById(s).setAttribute("style","visibility:hidden");
	  document.getElementById(str).innerHTML="<center> Description >> </center>";
	  document.getElementById(str).setAttribute("onclick","descr(this.id)");
	  }
</script></head>
<body id="body">
<div id="id1">
 <a id="idd" href="search.jsp"><img src="logo.jpg"/></a>
 <p style="position:absolute;top:20px;left:500px;font-size:20px;"> hello <span style="color:#ffcc00;font-size:35px;"><% out.println((String) session.getAttribute("user")); %> </span></p>
<button name="logout" id="idid" class="cc" onMouseOver="buton(this.id);"onMouseOut="butout(this.id);" onclick="logout();">Logout</button>
</div>

<div id="dstat"></div>
<div id="idf">
<button name="settings" id="car" class="cc"  onMouseOver="buton(this.id);"onMouseOut="butout(this.id);" onclick="settings()">your home</button>

</div>
<br><br><br>
<hr>
<div id="om" class="ic3" ></div>
<div id="stat" class="ic3"></div>
</body>
</html>
