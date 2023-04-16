<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
p {
	color: white;
	background-color: black;
	padding: 10px;
}

.heading {
	padding: 40px;
	font-size: 45px;
	background-color: #c1c100;
	color: #6c0f0f;
	border: aliceblue;
	font-family: cursive;
	font-style: oblique;
}
</style>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Book Store</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/admin">Home</a></li>


					<%
						String id = (String) session.getAttribute("email");
					//
					if (id == null) {
					%>
					<li class="nav-item"><a class="nav-link" href="/login">Login</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/register">Register</a>
					</li>
					<%
						}
					if (id != null) {
					%>
					<li class="nav-item"><a class="nav-link" href="/logout">Logout</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/admin/add">Add
							a Book</a></li>
					<%
						}
					%>
				</ul>
				<%
					String name = (String) session.getAttribute("name");
				if (name != null) {
				%>
				<span class="navbar-text"> Welcome ${name }!&nbsp&nbsp </span>
				<%
					}
				%>

				<form class="d-flex" role="search" action="search">
					<input class="form-control me-2" type="search"
						placeholder="Search By Author" aria-label="Search" name="name">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>

			</div>


		</div>
	</nav>

	<h1 class='text-center heading'>Welcome to Book Store</h1>
	<div class="container text-center">

		<table class="table">
			<thead>
				<tr>
					<th scope="col">Book image</th>
					<th scope="col">Book Title</th>
					<th scope="col">Book Description</th>
					<th scope="col">Book Price</th>
					<th scope="col">Edit/ Delete</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books }" var="book">
					<tr>
						<td><img src="${book.url }" class="img-fluid rounded"
							width=60px></td>
						<td>${book.title }</td>
						<td><p>${book.description }</p></td>
						<td>${book.price }</td>
						<td><a
							href="${pageContext.servletContext.contextPath }/admin/edit/${book.id }"><i
								class="fas fa-edit"></i></a> <a
							href="${pageContext.servletContext.contextPath }/admin/delete/${book.id }"><i
								class="fa fa-trash"></i></a></td>
					</tr>
				</c:forEach>


			</tbody>
		</table>
	</div>


</body>
</html>