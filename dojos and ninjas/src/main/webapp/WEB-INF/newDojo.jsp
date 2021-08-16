<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create  Dojo</title>
</head>
<body>

<h1>Create Dojo</h1>

<form:form action="/dojos/new" method="post" modelAttribute="dojo">

<p>Dojo Name:
<form:errors path="name" />
<form:input path="name" />
</p>
<input type="submit" value="Create Dojo" />



</form:form>

<a href="/">HOME</a>


<ul> 
	<c:forEach items="${dojos }" var="d"> 
		<li> <a href="/dojos/<c:out value="${d.id }" />"><c:out value="${d.name }"/> </a></li>
	
	
	</c:forEach>

</ul>







</body>
</html>