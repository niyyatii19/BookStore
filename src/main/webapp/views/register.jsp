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
						aria-current="page" href="showBooks">Home</a></li>
					<%
						String id = (String) session.getAttribute("email");

					if (id == null) {
					%>
					<li class="nav-item"><a class="nav-link" href="login">Login</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="register">Register</a>
					</li>
					<%
						}
					if (id != null) {
					%>
					<li class="nav-item"><a class="nav-link" href="logout">Logout</a>
					</li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container addPadding">
		<h1 class="heading">Register yourself here!</h1>
	</div>


	<div class="container addPadding">

		<form method="POST">
			<div class="row mb-3">
				<label for="inputUsername" class="col-sm-2 col-form-label">Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="name">
				</div>
			</div>
			<div class="row mb-3">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="email">
				</div>
			</div>
			<div class="row mb-3">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="password">
				</div>
			</div>

			<div class="row mb-3">
				<label for="inputPassword3" class="col-sm-4 col-form-label">Registering as User/Admin</label> 
					<select class="form-select"
					aria-label="Default select example" name="role">
					<option value="user">User</option>
					<option value="admin">Admin</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">Register</button>
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