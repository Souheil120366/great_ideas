<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<title>Book Share</title>
	
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	
	<!-- For any Bootstrap that uses JS -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript" src="/js/clearErrors.js"></script>
	
	
</head>
<body>


<div class="container mt-2 p-3 custom-width" style="border: 3px solid #ccc;">

	<div class="d-flex justify-content-between align-items-center">	
		<h1>Change your Entry</h1>
		<p><a href="/books">back to the shelves</a></p>
	</div>
	<br>
	<form:form action="/books/edit/${book.id}" method="POST" modelAttribute="book">
		<input type="hidden" name="_method" value="PUT">
		<input type="hidden" name="user" value="${user.id}">
		
		
		<form:errors id="titleErrors" path="title" class="text-danger"/>
		<div class="form-group d-flex align-items-center">
			<form:label class="col-md-3" path="title">Title </form:label>
			<form:input type="text" class="form-control" id="title" path="title"/>
		</div>
		<br>
		<form:errors id="authorErrors" path="author" class="text-danger"/>
		<div class="form-group d-flex align-items-center">
			<form:label class="col-md-3" path="author">Author</form:label>
			<form:input type="text" class="form-control" id="author" path="author"/>
		</div>
		<br>
		<form:errors id="my_thoughtsErrors" path="my_thoughts" class="text-danger"/>
		<div class="form-group d-flex align-items-center">
			<form:label class="col-md-3" path="my_thoughts">My thoughts</form:label>
			<form:textarea type="text" class="form-control" id="my_thoughts" path="my_thoughts" rows="3"/>
		</div>
		<br>
	
	
  		<div class="d-flex mt-2 justify-content-end">
  			<button type="submit" class="btn btn-primary">Submit</button>
  		</div>
  	
  
  	</form:form>
  	
</div>
    
    
</body>
</html>