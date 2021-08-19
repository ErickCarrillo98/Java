<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Product</title>
</head>
<body>

	<h1>Create Product</h1>
	<form:form action="/products/new" method="post"
		modelAttribute="product">
		<p>
			<form:label path="name">name:</form:label>
			<form:errors path="name" />
			<form:input path="name" />
		</p>
		<p>
			<form:label path="description">description:</form:label>
			<form:errors path="description" />
			<form:input path="description" />
		</p>
		<p>
			<form:label path="price">price:</form:label>
			<form:errors path="price" />
			<form:input path="price" />
		</p>
	<button>Create Product</button>
	
	<a href="/">HOME</a>



	</form:form>
</body>
</html>