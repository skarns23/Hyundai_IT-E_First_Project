<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<% 
	request.setCharacterEncoding("UTF-8");
	String postCode = request.getParameter("postCode");
   String add = request.getParameter("address");
   String loginId = request.getParameter("loginId");
out.println("postCode : "+ postCode +"<br>");
out.println("address : "+ add +"<br>");
out.println("loginId : "+ loginId +"<br>");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>






</body>
</html>