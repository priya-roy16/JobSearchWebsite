<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="List.css" />
</head>
<body>
    <br><br><br><br><br>
    <center>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%

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
ResultSet resultSet1= null;
String skills= null;
%>




<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String id=(String)session.getAttribute("thename");

String[] queArray = new String[100];
String[] ansArray= new String[100];
resultSet = statement.executeQuery("SELECT * FROM aptitudeans WHERE id='"+id+"'");
//resultSet1 = statement.executeQuery("SELECT * FROM jobs");
String aptans= null;
String aptque= null;
int i= 0;
while(resultSet.next())
{
    queArray[i]= resultSet.getString("question_number");
    ansArray[i]= resultSet.getString("answer");
    i++;
   
}
int length=i;
int marks=0;
resultSet1 = statement.executeQuery("SELECT * FROM aptitude");
while(resultSet1.next())
{
    for(i=0; i<length; i++)
    {
       
        
       if(queArray[i].equals(resultSet1.getString("question_number")))
               {
                   
                  
                   if(ansArray[i].equals(resultSet1.getString("answer")))
                   {
                
                       marks++;
                   }
               }
    }
}
ResultSet rs= null; 
ResultSet resultSet2= null;
int a=statement.executeUpdate("update emplogin set marks='"+marks+"' where id='"+id+"'");
%>
<table border="3" height="300px" width="600px">
<tr bgcolor="black">
<td align="center"><h1><font color="white">MARKS OF YOUR APTITUDE TEST:</font></h1></td>
    <%
        resultSet2 = statement.executeQuery("SELECT * FROM emplogin WHERE id='"+id+"'"); 
        
    %>
</tr>
<tr>

    <td align="center"><h1><% out.println(marks);
//resultSet2.getString("marks")
%></h1></td>
</tr>
<% 
  
}

catch (Exception e) {
e.printStackTrace();
}
%>
</table>


