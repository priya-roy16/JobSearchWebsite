<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css" />
</head>
<body background="https://previews.123rf.com/images/billyphoto2008/billyphoto20081010/billyphoto2008101000036/8093237-classic-royal-design-background-3.jpg">
    <br><br><br><br><br>
    <center>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String name=request.getParameter("name"); 
session.putValue("name",name); 
String pass=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mp2","root","1234"); 
Statement st= con.createStatement(); 
ResultSet r2=st.executeQuery("select * from adminlogin where username='"+name+"'"); 
if(r2.next()) 
{ 
    if(r2.getString(2).equals(pass)) 
    { 
    response.sendRedirect("adminstart.html");
    } 
    else 
        { 
              out.println("<script type=\"text/javascript\">");
              out.println("alert('User or password incorrect');");
              out.println("location='adminlogin.html';");
              out.println("</script>");
        }
}
else
    {
              out.println("<script type=\"text/javascript\">");
              out.println("alert('User or password incorrect');");
              out.println("location='adminlogin.html';");
              out.println("</script>");
    }
 
%>
</body>
</html>