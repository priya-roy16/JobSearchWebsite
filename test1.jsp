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
String skillemp=(String)session.getAttribute("skillemp");
String id=(String)session.getAttribute("thename");

String[] stArray = new String[100];
//resultSet = statement.executeQuery("SELECT * FROM resume WHERE id='"+id+"'");
resultSet1 = statement.executeQuery("SELECT * FROM jobs");
//String skillemp= null;

/*if(resultSet.next())
{
   skillemp= resultSet.getString("skills"); 
   out.println("<script type=\"text/javascript\">");
   out.println("location='test1.jsp';");
   out.println("</script>");
    
}
 else 
        { 
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Details Incorrect');");
              out.println("location='emplogin.html';");
              out.println("</script>");
        }
*/
int i=0;
while(resultSet1.next()){


skills= resultSet1.getString("skills");


if(skills.equals(skillemp))
{
    stArray[i]= resultSet1.getString("jobid");
    i++;
}
}
int length= i;
for(i=0; i<length; i++)
{

int x=statement.executeUpdate("insert into matchjob values ('"+stArray[i]+"','"+id+"')");
out.println("<script type=\"text/javascript\">");
   out.println("alert('Skills Matched successfully');");
   out.println("location='emplogin.html';");
   out.println("</script>");

    
}



 
}
 
catch (Exception e) {
e.printStackTrace();
}
%>




