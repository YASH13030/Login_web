<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Confirmed</title>
<%
String name= request.getParameter("pro");
System.out.println(name);
int quantity = Integer.parseInt(request.getParameter("quan"));
int dbquantity=0;
try
{
	//read and establish connection.
Class.forName("com.mysql.cj.jdbc.Driver");
Connection connection=DriverManager.getConnection
		("jdbc:mysql://localhost:3306/pagelogin", "root", "sharda1234@");
Statement statement=connection.createStatement(); 
ResultSet set=statement.executeQuery("SELECT * FROM stockeditems ");
while(set.next())
{
	
	if(name==set.getString("Iname")){
		dbquantity = set.getInt(3)-quantity;
		System.out.println(dbquantity);
	}
	
}
String insert = "UPDATE `pagelogin`.`stockeditems` SET `Iquantity` = '"+dbquantity+"' where Iname ='"+name+"'" ;
statement.executeUpdate(insert);

}
catch (Exception e) {
	System.out.println(e);
}

%>
</head>
<body>

</body>
</html>