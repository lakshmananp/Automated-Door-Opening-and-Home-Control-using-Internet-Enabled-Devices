<%@ page language="java" %>
<%@ page import="java.sql.*" %> 
<%
session.removeAttribute("user");
session.invalidate();
response.getWriter().println("1"); 
%>
