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
String company=request.getParameter("company"); 
session.putValue("company",company);
String position=request.getParameter("position");
String skills=request.getParameter("skills");    
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mp2","root","1234"); 
Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into jobs(companyname,position,skills) values ('"+company+"','"+position+"','"+skills+"')"); 
   out.println("<script type=\"text/javascript\">");
   out.println("alert('Job added Successfully!');");
   out.println("location='jobs.html';");
   out.println("</script>");

%>
<br>
</body>
</html>