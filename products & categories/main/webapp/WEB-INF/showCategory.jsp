<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Category</title>
</head>
<body>

	<h1>
		<c:out value="${category.name }" /></h1>

	<form action="/categories/${category.id }" method="post">
		ADD A PRODUCT: 
		
	<select name="productId">

			<c:forEach items="${products }" var="p">
				<option value="${p.id }"><c:out value="${p.name }" /> </option>

			</c:forEach>
		</select>
		<button>ADD PRODUCT</button>


	</form>



	<hr />
	<c:out value="${category.name }" /> Has these products <br />
	

	<p>
		<c:forEach items="${category.products }" var="cn">
			<li>${cn.name } </li>

		</c:forEach>
	</p>
	<a href="/">HOME</a>
</body>
</html>