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

	<h1>Create a new idea:</h1>
		
	<br>
	<form:form action="/new/idea" method="POST" class="p-3" modelAttribute="idea">
		<input type="hidden" name="user" value="${user.id}">
	
		<form:errors id="contentErrors" path="content" class="text-danger"/>
		<div class="form-group d-flex align-items-center">
			<form:label class="col-md-3" path="content">Content: </form:label>
			<form:input type="text" class="form-control" id="content" path="content"/>
		</div>
		<br>
		
	
  		<div class="d-flex mt-2 justify-content-end">
  			<button type="submit" class="btn btn-primary">Create</button>
  		</div>
  	
  
  	</form:form>
  	
</div>
    
    
</body>
</html>