<%-- 
    Document   : personalityquiz1
    Created on : Nov 19, 2019, 12:51:12 PM
    Author     : APEX
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title> 
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String id=(String)session.getAttribute("thename");
//String pquestion=(String)session.getAttribute("qnumber");

String aanswer=request.getParameter("aanswer");
String aquestion=request.getParameter("aquestion");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mp2","root","1234"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into aptitudeans values ('"+id+"','"+aquestion+"','"+aanswer+"')"); 
   out.println("<script type=\"text/javascript\">");
   out.println("alert('QUESTION ANSWERED');");
   out.println("location='aptitudequiz.jsp';");
   out.println("</script>");

%>
<br>
</body>
</html>
