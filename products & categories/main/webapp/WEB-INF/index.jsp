<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products and categories</title>
</head>
<body>

	<h1>Products and categories</h1>

	<a href="/products/new">New Product</a>
	<a href="/categories/new">New Category</a>


	<h3>All products</h3>
	<table>
		<thead>
			<tr>
				<td>Name</td>
				<td>Description</td>
				<td>Price</td>
			</tr>
		</thead>
		<tbody>

			<c:forEach items="${allProducts}" var="p">


				<tr>
					<td><a href="/products/${p.id }"> <c:out
								value="${p.name }" />
					</a></td>
					<td><c:out value="${p.description}" /></td>
					<td><c:out value="${p.price }" /></td>

				</tr>
			</c:forEach>

		</tbody>


	</table>
	<hr />
	<h2>All categories</h2>
	<table>
		<thead>
			<tr>
				<td>CATEGORY NAME <td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allCategories }" var="c">
				<tr>
					<td><a href="/categories/${c.id }"> <c:out
								value="${c.name}" /></a>
				</tr>



			</c:forEach>

		</tbody>


	</table>
</body>
</html>