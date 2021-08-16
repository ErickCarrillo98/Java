<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Ninja</title>
</head>
<body>

<h1>Create Ninja</h1>
<form:form action="/ninjas/new" method="post" modelAttribute="ninja">	
	<form:errors path="*" />
<!-- Choosing DOJO -->

<form:label path="dojo">Dojo</form:label>
<form:errors path="dojo"/>
<form:select path="dojo">
	<option value="" disabled selected>
	
	<c:forEach items="${dojo}" var="d">
		<form:option value="${d.id}">
			<c:out value= "${d.name }" />
		</form:option>

	</c:forEach>
</form:select>
	
<p>
First Name:
<form:errors path="firstName"/>
<form:input path="firstName"/>

</p>
<p>
Last Name:
<form:errors path="lastName"/>
<form:input path="lastName"/>

</p>
<p>
Age:
<form:errors path="age"/>
<form:input path="age"/>

</p>

<a href="/">HOME</a>


<p>

<input type="submit" value="create Ninja"/>
</form:form>

</body>
</html>