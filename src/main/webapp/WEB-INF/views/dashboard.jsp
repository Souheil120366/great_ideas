<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<title>Great Ideas</title>
	
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	
	<!-- For any Bootstrap that uses JS -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	
	 		
	
</head>
<body>
	
	<div class="container-fluid vh-100 mt-5 custom-width align-items-center">
		
		<div class="d-flex justify-content-between">	
			<h1>Welcome, ${user.userName} !</h1>
			<p><a href="/logout">Logout</a></p>
		</div>
		<div class="d-flex justify-content-between">
			<h3 class="col-8">Ideas</h3>
			<p><a href="/ideas_lh">Low Likes</a></p>
			<p><a href="/ideas">High Likes</a></p>
		</div>
		<table class="table">
	    <thead>
	        <tr>
	            <th>Ideas</th>
	            <th>Created By:</th>
	            <th>Likes</th>
	            <th>Action</th>
	            
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach var="oneIdea" items="${ideasWithStates}">
	    		<tr>
	    			
	    			<td class="col-4"><a href="/ideas/${oneIdea.id}"><c:out value="${oneIdea.content}"></c:out></a></td>
	    			<td class="col-3"><c:out value="${oneIdea.user.userName}"></c:out></td>
	    			<td class="col-2"><c:out value="${oneIdea.nb_likes}"></c:out></td>
	    			<td class="col-2">
	    			
	    				<form action="/likeState" method="POST" >
	    					<input type="hidden" name="ideaId" value="${oneIdea.id}">
	    					<input type="hidden" name="user" value="${user.id}">
	    					<input type="submit" class="btn btn-link p-0 border-0 submit-button" value="${oneIdea.state}" name="state"/>
	    				</form>
	    			</td>
	    		</tr>
	    	</c:forEach>
	    </tbody>
	    </table>
	    <a href="/ideas/new" class="btn btn-primary">
			<c:out value="Create an idea" />
		</a>
    </div>
    
</body>
</html>