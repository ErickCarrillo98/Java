<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Dojo</title>
</head>
<body>

<h1> <c:out value="${dojo.name}"/> </h1>

<table>
	<thead>
		<tr>
			<td>First Name</td>
			<td> Last Name</td>
			<td>Age</td>
			
		</tr>
	</thead>
	<tbody>
	
		<c:forEach items="${ninjas }" var="n">
		
			<tr>
				<td><c:out value="${n.firstName}" /></td>
				<td><c:out value="${n.lastName}" /> </td>
				<td><c:out value="${n.age}" /></td>
		
	
		</c:forEach>
	
	
	</tbody>

</table>

<a href="/">Home</a>


</body>
</html>