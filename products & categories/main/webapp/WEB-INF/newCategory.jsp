<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Category</title>
</head>
<body>
<h1>Create a category</h1>

<form:form action="/categories/new" method ="post" modelAttribute="category">
	<p>
	
		<form:label path="name">name:</form:label>
		<form:errors path="name"/>
		<form:input path="name"/>
	
	
	</p> 
	
	<input type="submit" value="create" />

</form:form>





</body>
</html>