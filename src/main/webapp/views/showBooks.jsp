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
	crossorigin="anonymous">
	
</script>
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

.paddingRight {
	padding-right: 40px;
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
					<li class="nav-item"><a class="nav-link"
						href="/user/likedBooks">Liked Books</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/user/readLaterBooks">Read Later Books</a></li>
					<%
						}
					%>
				</ul>
				<%
					String name = (String) session.getAttribute("name");
				if (name != null) {
				%>
				<span class="navbar-text"> Welcome ${name }! &nbsp&nbsp</span>

				<form class="d-flex" role="search" action="/search">
					<input class="form-control me-2" type="search"
						placeholder="Search By Author" aria-label="Search" name="name">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<%
					}
				%>

			</div>


		</div>
	</nav>
	<div>
		<h1 class='text-center heading'>Welcome to Book Store</h1>
		<br>
		<ul class="nav justify-content-end paddingRight">
			<li class="nav-item">
				<form action="/showBooks">
					<input class="btn btn-primary" type="submit" name="isClick"
						value="Order By Price" />
				</form>
			</li> &nbsp &nbsp &nbsp
			<li class="nav-item">
				<form action="/showBooks">
					<label class="form-label " for="priceRange">Search For
						price range</label> <input class="form-control col-sm-2" type="number"
						step="0.01" name="min" value="0.00" /> <input
						class="form-control col-sm-2" type="number" step="0.01" name="max"
						value="10.0" />
					<button type="submit" class="btn btn-primary">Search</button>
				</form>
			</li>

		</ul>
	</div>


	<div class="container overflow-hidden text-center">
		<div class="row gx-5 row-cols-3">

			<c:forEach items="${books}" var="book">
				<div class='col'>
					<div class='p-3'>
						<div class="card">
							<img src="${book.url }" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">${book.title }</h5>
								<h6 class="card-body">$ ${book.price }</h6>
								<blockquote class="blockquote mb-0">
									<p>${book.description }</p>
									<footer class="blockquote-footer">
										<cite title="Source Title">${book.author.name }</cite>
									</footer>
								</blockquote>
								<div class="card-footer text-body-secondary">
									<%
										String id1 = (String) session.getAttribute("email");

									if (id1 != null) {
									%>
									<a href="/user/book/${book.id }" class="btn btn-primary"> <i
										class="fa fa-thumbs-up fa-lg" aria-hidden="true"></i></a>
									&nbsp&nbsp <a href="/user/readLaterBook/${book.id }"
										class="btn btn-primary"><i class="fa fa-book fa-lg"></i></a>

									<%
										}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>


</body>
</html>