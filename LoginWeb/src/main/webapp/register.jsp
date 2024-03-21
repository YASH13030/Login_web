<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

try
{
	//read and establish connection.
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connection=DriverManager.getConnection
		("jdbc:mysql://localhost:3306/pagelogin", "root", "sharda1234@");
Statement statement=connection.createStatement(); 
ResultSet set=statement.executeQuery("SELECT * FROM customers");

String name = request.getParameter("un");
String password = request.getParameter("pwd");
String cpass = request.getParameter("cps");

if(password.equals(cpass)) {
	
	statement.executeUpdate("INSERT INTO `pagelogin`.`customers` (`name`, `password`) VALUES ('"+name+"', '"+password+"')");
	response.sendRedirect("registersuccess.html");
}

}

catch (Exception e) {
	System.out.println(e);
}

%>
</body>
</html>