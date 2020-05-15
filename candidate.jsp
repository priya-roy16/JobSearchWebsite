<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="personality.css" />
</head>
<body background="adminstart.jpg">
    <br><br><br><br><br>
    <center>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String id = request.getParameter("companyname");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mp2";
String userId = "root";
String password = "1234";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h1><font color="green"><strong>CANDIDATE SCORE:</strong></font></h1><br><br>
<table align="center" cellpadding="5" cellspacing="5" border="5" height="100%" width="100%">
<tr>

</tr>
<tr bgcolor="black">
    <td><font color="white"><b>EMPLOYEE ID</font></b></td>
        <td><font color="white"><b>NAME</font></b></td>
        <td colspan="2"><font color="white"><b>APTITUDE MARKS</font></b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM emplogin";
String qnumber= null;
resultSet = statement.executeQuery(sql);


while(resultSet.next()){

//qnumber= resultSet.getString("question_number");
//session.setAttribute("qnumber", qnumber);
%>
<tr bgcolor="white">
    <td><%=resultSet.getString("id")%></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("marks") %></td>
</tr>
<% 
}


} catch (Exception e) {
e.printStackTrace();
}
%>
</table>