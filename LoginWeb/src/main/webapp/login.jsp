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
String name = request.getParameter("un");
String password = request.getParameter("pss");

try
{
	//read and establish connection.
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connection=DriverManager.getConnection
		("jdbc:mysql://localhost:3306/pagelogin", "root", "sharda1234@");
Statement statement=connection.createStatement(); 
ResultSet set=statement.executeQuery("SELECT * FROM customers");

while(set.next()) {

	if(set.getString(2).equals(name)){
	
		if(set.getString(3).equals(password)){
			response.sendRedirect("LoginSuccess.html");
		}
	}
}
}

catch (Exception e) {
	System.out.println(e);
}

%>
</body>
</html>