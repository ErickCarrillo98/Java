<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show product</title>
</head>
<body>
	<h1><c:out value="${product.name }" /></h1>
	
	
	
	<form action="/products/${product.id }" method = "post">
	ADD A CATEGORY: 
	
	<select name="categoryId">
	
	
		<c:forEach items="${categories }" var="c">
		<option value="${c.id }"><c:out value="${c.name }"/> </option>
		
		</c:forEach>
	</select>
	<button>add category</button>
	
	</form>
	
	<hr/>
	
	<c:out value="${product.name }" /> has these categories <br/>
	<p>
	
		<c:forEach items="${product.categories }" var="cc">
			<li>${cc.name }</li>
		
		
		</c:forEach>
	
	</p>
	
<a href ="/">HOME</a>
	

</body>
</html>