<%@ page import="java.sql.Connection" %> 
<%@ page import="db.DBManager" %> 
<%@ page import="java.sql.DriverManager" %>   
<%@ page import="service.ProductionSeviceImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>Shopping Receipt</h1>
  <div style='text-align:center'>
  	<h2>
	 <% 
	 	DBManager db = new DBManager();
	 	Connection conn = DBManager.getConnection();
	 	if(conn == null){
	 		out.print("Cannot connect MySQL Database via localhost:3306 ,ID:'root', PW:'' <br>Please Check.");
	 	}else{
	 		out.print("Connection Success");
	 	}
	 %>
	 <a href="getOption">Forward</a>
	 </h2>
	 
 </div>
</body>
</html>