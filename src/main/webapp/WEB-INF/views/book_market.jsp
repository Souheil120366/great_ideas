<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<title>Read Share</title>
	
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	
	<!-- For any Bootstrap that uses JS -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	
	 		
	
</head>
<body>
	
	<div class="container-fluid vh-100 mt-5 custom-width align-items-center">
		<div class="form-group mt-3 d-flex justify-content-between">
			<div>
				<h3>Hello, ${user.userName}. Welcome to ..</h1>
				<h1>The Book Broker!</h3>
			</div>
			<div>
				<p><a href="/books">back to the shelves</a></p>
			</div> 
		</div>
		
		<table class="table">
	    <thead>
	        <tr>
	            <th>ID</th>
	            <th>Title</th>
	            <th>Author Name</th>
	            <th>Owner</th>
	            <th>Actions</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach var="oneBook" items="${availableBooks}">
	    		<tr>
	    			<td><c:out value="${oneBook.id}"></c:out></td>
	    			<td><a href="/books/${oneBook.id}"><c:out value="${oneBook.title}"></c:out></a></td>
	    			<td><c:out value="${oneBook.author}"></c:out></td>
	    			<td><c:out value="${oneBook.user.userName}"></c:out></td>
	    			<td>
	    				<c:set var="isUser" value="${oneBook.user.id == user.id}" />
	    				<c:choose>
	    	    		<c:when test="${isUser}">
	    	    			<a href="/books/${oneBook.id}/edit" class="btn btn-primary">
	    	    				<c:out value="Edit" />
	    	    			</a>
                	
	    	    			<a href="/delete/${oneBook.id}" class="btn btn-danger">
	    	    				<c:out value="Delete" />
	    	    			</a>
	    	    		</c:when>
	    	    		<c:otherwise>
	    	    		 	<form:form action="/borrowed_book" method="POST" modelAttribute="borrowed_book">
	    	    		 		<input type="hidden" name="user" value="${user.id}">
	    	    		 		<input type="hidden" name="bookId" value="${oneBook.id}">
	    	    		 		<input type="submit" value="borrow">
	    	    		 	</form:form>
	    	            </c:otherwise>
	    	        </c:choose>
	    				
	    			</td>
	    		</tr>
	    	</c:forEach>
	    </tbody>
	    </table>
	    <br>
	    <h3>Books I'm Borrowing..</h3>
	    <br>
	    <table class="table">
	    <thead>
	        <tr>
	            <th>ID</th>
	            <th>Title</th>
	            <th>Author Name</th>
	            <th>Owner</th>
	            <th>Actions</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach var="oneBook" items="${borrowedBooks}">
	    		<tr>
	    			<td><c:out value="${oneBook.id}"></c:out></td>
	    			<td><a href="/books/${oneBook.id}"><c:out value="${oneBook.title}"></c:out></a></td>
	    			<td><c:out value="${oneBook.author}"></c:out></td>
	    			<td><c:out value="${oneBook.user.userName}"></c:out></td>
	    			<td>
	    				<a href="/delete_borrowed_book/${oneBook.id}">return</a>
	    				
	    			</td>
	    		</tr>
	    	</c:forEach>
	    </tbody>
	    </table>
	
    </div>
    
</body>
</html>