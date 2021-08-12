<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

		<a href="/languages"><h1>Dashboard</h1></a>
		<a href="/languages/delete/<c:out value="${language.id}"/>"><h1>Delete</h1></a>
		<form:form action="/languages/edit/${language.id}" method="post" modelAttribute="language">
		    <input type="hidden" name="_method" value="put">
			    <p>
			        <form:label path="name">Name</form:label>
			        <form:input path="name"/>
			        <form:errors path="name"/>

			    </p>
			    <p>
			        <form:label path="creator">Creator</form:label>
			        <form:input path="creator"/>
    				<form:errors path="creator"/>
			    </p>
			    <p>
			        <form:label path="version">Version</form:label>
			        <form:input path="version"/>
     		 		<form:errors path="version"/>
			    </p>
		    <input type="submit" value="Submit"/>
		</form:form>
</body>
</html>