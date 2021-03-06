<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>


	<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>Creator</th>
				<th>Version</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${languages}" var="language">
				<tr>
					<td><a href="languages/<c:out value="${language.id}"/>"><c:out
								value="${language.name}" /></a></td>
					<td><c:out value="${language.creator}" /></td>
					<td><c:out value="${language.version}" /></td>
					<td><a
						href="/languages/delete/<c:out value="${language.id}"/>">Delete</a>
						<a href="languages/edit/<c:out value="${language.id}"/>">Edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<form:form action="/languages" method="post" modelAttribute="addNew">
		<p>
			<form:label  path="name">Name</form:label>
			<form:input  path="name" />
			<form:errors path="name" />

		</p>
		<p>
			<form:label  path="creator">Creator</form:label>
			<form:input  path="creator" />
			<form:errors path="creator" />
		</p>
		<p>
			<form:label  path="version">Version</form:label>
			<form:input  path="version" />
			<form:errors path="version" />
		</p>
		<input id="btn" type="submit" value="Submit" />
	</form:form>

</body>
</html>