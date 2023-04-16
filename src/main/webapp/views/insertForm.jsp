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
<style>
.error {
	color: red;
}

.addPadding {
	padding: 50px;
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
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container addPadding">
		<h1 class="heading">Add a new Book</h1>
	</div>


	<div class="container addPadding">

		<form class="row g-3" method="POST"  enctype=”multipart/form-data”  >
			<div class="col-md-6">
				<label class="form-label">Book title</label> <input type="text"
					class="form-control" id="title" name="title"  value = "${book.title }"required>
			</div>
			<div class="col-md-6">
				<label class="form-label">Author Name</label> <input type="text"
					class="form-control" id="authorName" name="name" value = "${book.author.name }" required>
			</div>
			<div class="col-12">
				<label class="form-label">Book Description</label>
				<textarea type="text" class="form-control" id="description"  rows = 2 name = "description"  value = "${book.description }" required> </textarea>
			</div>
			
			<div class="col-md-6">
				<label  class="form-label">Author Country</label> <input
					type="text" class="form-control" id="country" name= "country" value = "${book.author.country }" required>
			</div>
			
			<div class="col-md-6">
				<label class="form-label">Add photo</label> 
				<input class="form-control" type="text" name="image" accept="image/png, image/jpg" value= "${book.url }"/>
			</div>
			
			<div class="col-md-6">
				<label class="form-label">Set price</label> 
				<input class="form-control" type="number" step = "0.01" name="price" value = "${book.price }" />
			</div>
			
			<div class="col-12">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>

	<div>
		<span class='error'> <c:if test="${error != null }">
								${error }
							</c:if>
		</span>
	</div>
</body>
</html>