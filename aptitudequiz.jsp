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
<h1><font color="green"><strong>APTITUDE QUIZ</strong></font></h1><br><br>
<table align="center" cellpadding="5" cellspacing="5" border="5" height="100%" width="100%">
<tr>

</tr>
<tr bgcolor="black">
    <td><font color="white"><b>QUESTION NUMBER</font></b></td>
        <td><font color="white"><b>QUESTION</font></b></td>
        <td colspan="2"><font color="white"><b>ANSWER</font></b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT question_number,question FROM aptitude";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){

//qnumber= resultSet.getString("question_number");
//session.setAttribute("qnumber", qnumber);
%>
<tr bgcolor="white">
<form action="aptitudequiz1.jsp" method="post">
    <td><input type="text" name="aquestion" size="40" value="<%=resultSet.getString("question_number")%>" readonly></td>
<td><%=resultSet.getString("question") %></td>
<td><input type="text" name="aanswer" size="40"></td>
<td><button type="submit" class="submit">SUBMIT ANSWER</button></td>
</form>
</tr>
<% 
}
 
}

 catch (Exception e) {
e.printStackTrace();
}
%>
</table>